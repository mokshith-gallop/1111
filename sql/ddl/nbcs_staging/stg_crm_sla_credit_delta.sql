-- stg_crm_sla_credit_delta: CDC delta feed from CRM.SLA_CREDITS (Oracle crmdb01)
-- Source: staging.stg_crm_sla_credit_delta | Partition: extract_ts STRING -> TIMESTAMP
CREATE TABLE stg_crm_sla_credit_delta (
  sla_credit_id               INT64,
  program_id                  INT64,
  sla_target_id               INT64,
  period_month                STRING,
  credit_amount               NUMERIC(12, 2),
  reason                      STRING,
  op                          STRING,
  change_ms                   INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  extract_ts                  TIMESTAMP
)
PARTITION BY DATE(extract_ts);
