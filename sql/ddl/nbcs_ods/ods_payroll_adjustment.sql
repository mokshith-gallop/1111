-- ods_payroll_adjustment: Delta-merged from staging.stg_fin_payroll_adj_delta
-- Source: ods.ods_payroll_adjustment
-- Partition: period_month STRING kept as STRING; ingestion-time _PARTITIONDATE
CREATE TABLE ods_payroll_adjustment (
  adjustment_id               INT64,
  agent_id                    INT64,
  adj_type                    STRING,
  amount                      NUMERIC(12, 2),
  last_change_ts              TIMESTAMP,
  period_month                STRING
)
PARTITION BY _PARTITIONDATE;
