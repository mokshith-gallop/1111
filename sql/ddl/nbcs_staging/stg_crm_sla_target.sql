-- stg_crm_sla_target: Sqoop mirror of CRM.SLA_TARGETS (Oracle crmdb01)
-- Source: staging.stg_crm_sla_target | Partition: load_date STRING -> DATE
CREATE TABLE stg_crm_sla_target (
  sla_target_id               INT64,
  program_id                  INT64,
  queue_id                    INT64,
  metric_code                 STRING,
  target_value                NUMERIC(10, 4),
  penalty_pct                 NUMERIC(5, 2),
  effective_ts                INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
