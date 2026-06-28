-- stg_crm_contract_line: Sqoop mirror of CRM.CONTRACT_LINES (Oracle crmdb01)
-- Source: staging.stg_crm_contract_line | Partition: load_date STRING -> DATE
CREATE TABLE stg_crm_contract_line (
  contract_line_id            INT64,
  contract_id                 INT64,
  line_no                     INT64,
  service_code                STRING,
  uom                         STRING,
  unit_rate                   NUMERIC(12, 4),
  min_commit                  NUMERIC(12, 2),
  effective_dt                STRING OPTIONS(description = 'Oracle string YYYYMMDDHH24MISS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
