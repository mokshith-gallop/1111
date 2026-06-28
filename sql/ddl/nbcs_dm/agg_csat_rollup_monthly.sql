-- agg_csat_rollup_monthly: Monthly CSAT rollup (GROUPING SETS)
-- Source: dm.agg_csat_rollup_monthly
-- Partition: period_month STRING -> ingestion-time _PARTITIONDATE
CREATE TABLE agg_csat_rollup_monthly (
  client_sk                   INT64,
  program_sk                  INT64,
  site_code                   STRING,
  surveys                     INT64,
  avg_csat                    NUMERIC(5, 2),
  pct_promoters               NUMERIC(5, 2),
  pct_detractors              NUMERIC(5, 2),
  grouping_id                 INT64,
  period_month                STRING
)
PARTITION BY _PARTITIONDATE;
