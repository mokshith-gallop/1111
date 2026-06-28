# Implementation Approach

## Implementation Approach — BigQuery Physical Schema DDL

### DDL Generation & File Organization

A Python generator script (`tools/generate_bq_ddl.py`) reads `manifests/tables.yaml` and emits 101 BigQuery `CREATE TABLE` SQL files, organized by dataset:

```
sql/ddl/
├── nbcs_staging/    (45 files: one per staging table)
├── nbcs_ods/        (31 files: 30 existing + ods_sla_target)
└── nbcs_dm/         (25 files: 9 dims + 9 facts + 7 aggs)
```

**One file per table** because:
- AC1 requires naming the specific failing table on DDL error — individual files enable granular error attribution
- MVS `migration:` blocks reference each file as a discrete `kind: ddl` step
- Enables parallel validation and independent code review

The generator encodes all locked type-mapping, partitioning, clustering, and description rules. Its output (the committed SQL files) is the deliverable; the generator is a development tool for reproducibility.

### Core Type Mapping (hardcoded in generator)

| Hive Type | BigQuery Type | Affected Count |
|---|---|---|
| `BIGINT` | `INT64` | ~400 columns |
| `INT` | `INT64` | ~60 columns |
| `STRING` | `STRING` | ~300 columns |
| `BOOLEAN` | `BOOL` | ~40 columns |
| `TIMESTAMP` | `TIMESTAMP` | ~70 columns |
| `DOUBLE` | `FLOAT64` | 2 columns (speech_analytics) |
| `DATE` | `DATE` | 0 source columns (only generated partition columns) |
| `DECIMAL(p,s)` | `NUMERIC(p,s)` | 52 columns across 7 variants |
| `ARRAY<STRUCT<...>>` | `ARRAY<STRUCT<...>>` | 2 columns |
| `ARRAY<STRING>` | `ARRAY<STRING>` (REPEATED) | 1 column |
| `MAP<STRING,STRING>` | `ARRAY<STRUCT<key STRING, value STRING>>` | 1 column |

### Partition Strategy Implementation

BigQuery requires `DATE`, `TIMESTAMP`, `DATETIME`, or `INT64` for partitioning — Hive STRING partition columns are type-promoted:

| Source Partition Pattern | BigQuery Implementation | Tables |
|---|---|---|
| `date_key INT` (DM facts/aggs) | Ingestion-time partitioning via `_PARTITIONTIME` | 11 facts + 5 aggs partitioned by date_key |
| `week_start_key INT` | Ingestion-time partitioning via `_PARTITIONTIME` | agg_agent_weekly |
| `period_month STRING` | Kept as `STRING`; partition via ingestion-time `_PARTITIONTIME` | fact_billing_line, agg_program_monthly, agg_csat_rollup_monthly, agg_billing_monthly, ods_payroll_adjustment, ods_sla_credit |
| `eff_from_year INT` | Integer-range partition: `RANGE_BUCKET(eff_from_year, GENERATE_ARRAY(2020, 2030, 1))` | 3 SCD-2 tables |
| `load_date STRING` | Type-promoted to `DATE`; `PARTITION BY load_date` | 27 staging sqoop mirrors |
| `extract_ts STRING` | Type-promoted to `TIMESTAMP`; `PARTITION BY extract_ts` | 8 staging delta feeds |
| `feed_date STRING` (+`client_code`) | `feed_date` promoted to `DATE` (partition); `client_code` as `CLUSTER BY` | 10 staging file feeds |
| `event_date/snapshot_date/call_date/sched_date STRING` | Type-promoted to `DATE`; direct partition column | 15+5 ODS cleansed + delta-merge tables |
| `work_month/swap_month/event_month STRING` | Kept as `STRING`; partition via ingestion-time `_PARTITIONTIME` | 3 ODS delta-merge tables |
| Unpartitioned (ACID + dims) | No partitioning | 4 ACID + 9 DM dims |

**Key rule:** Hive `CLUSTERED BY ... INTO N BUCKETS` (ACID bucketing for 4 ODS tables, hash bucketing for `stg_tel_call` and `fact_interaction`) is **NOT** carried to BigQuery — ACID bucketing is Hive-specific and Hive hash-bucketing has no BQ equivalent. Performance intent is met by BQ clustering.

### Clustering Columns

Applied per the locked Performance Optimization matrix. Examples:
- `fact_interaction`: `CLUSTER BY (channel, agent_sk, program_sk)`
- `agg_agent_daily`: `CLUSTER BY (agent_sk, site_code)`
- DM dimensions: `CLUSTER BY (<pk_column>)` (e.g., `dim_date` clustered by `date_key`)
- Staging file feeds: `CLUSTER BY (client_code)`
- All other staging/ODS tables: no explicit clustering

### Column Descriptions

All 68 source column COMMENTs carried as BigQuery `OPTIONS(description=...)`:
- Epoch annotations preserved: `'epoch SECONDS (legacy)'`, `'epoch MILLISECONDS (legacy)'`
- **Lying columns** get explicit warnings:
  - `stg_fin_invoice.issued_ts_sec`: `'WARNING: column name says seconds but VALUES ARE EPOCH MILLISECONDS — see EPOCH-POLICY.md'`
  - `stg_fin_invoice.due_ts_sec`: `'WARNING: column name says seconds but VALUES ARE EPOCH MILLISECONDS — see EPOCH-POLICY.md'`
- Oracle string dates: `'Oracle string YYYYMMDDHH24MISS (legacy)'`

### Staging Epoch Policy

Per `docs/EPOCH-POLICY.md` and locked Schema & Data Model decision: all epoch BIGINT columns in `nbcs_staging` remain `INT64` — **no conversion to TIMESTAMP**. The conversion boundary is ODS. This is enforced in the generator and validated by the MVS spec.

### Multi-Column Hive Partitions

Two tables have multi-column Hive partitions that BigQuery cannot replicate:
- `stg_wfm_schedule`: `PARTITIONED BY (load_date STRING, site_code STRING)` → BigQuery: `load_date DATE` as partition, `site_code` becomes a regular column (no clustering specified per locked decision)
- `fact_interaction`: `PARTITIONED BY (date_key INT, channel STRING)` → BigQuery: ingestion-time partition (`_PARTITIONTIME`), `channel` moves to `CLUSTER BY`

### MVS Harness Integration

DDL files integrate with the project's Mode-2 build-and-verify pattern:
1. Three MVS spec files (`tests/target_schema/nbcs_staging.mvs.yaml`, `tests/target_schema/nbcs_ods.mvs.yaml`, `tests/target_schema/nbcs_dm.mvs.yaml`)
2. Each spec's `migration.steps` apply DDL files as `kind: ddl` CUT artifacts
3. Validation suites use `schema_conformance` pattern with `source_database` cross-checks against live Hive
4. The harness creates an ephemeral BigQuery dataset, applies DDL verbatim, then validates schema against source ground truth
