-- ods_sla_target: NEW table — promotes staging.stg_crm_sla_target into ODS
-- Remediates layer-skip where vw_queue_sla_attainment read directly from staging
-- Partition: snapshot_date DATE (follows ODS cleanse pattern)
CREATE TABLE ods_sla_target (
  sla_target_id               INT64 NOT NULL,
  program_id                  INT64,
  queue_id                    INT64,
  metric_code                 STRING,
  target_value                NUMERIC(10, 4),
  penalty_pct                 NUMERIC(5, 2),
  effective_ts                TIMESTAMP,
  snapshot_date               DATE
)
PARTITION BY snapshot_date
OPTIONS(description = 'SLA targets promoted from staging - layer-skip remediation');
