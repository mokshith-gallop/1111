-- ods_sla_credit: Delta-merged from staging.stg_crm_sla_credit_delta
-- Source: ods.ods_sla_credit
-- Partition: period_month STRING kept as STRING; ingestion-time _PARTITIONDATE
CREATE TABLE ods_sla_credit (
  sla_credit_id               INT64,
  program_id                  INT64,
  sla_target_id               INT64,
  credit_amount               NUMERIC(12, 2),
  reason                      STRING,
  last_change_ts              TIMESTAMP,
  period_month                STRING
)
PARTITION BY _PARTITIONDATE;
