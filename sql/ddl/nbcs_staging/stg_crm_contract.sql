-- stg_crm_contract: Sqoop mirror of CRM.CONTRACTS (Oracle crmdb01)
-- Source: staging.stg_crm_contract | Partition: load_date STRING -> DATE
CREATE TABLE stg_crm_contract (
  contract_id                 INT64,
  client_id                   INT64,
  program_id                  INT64,
  contract_no                 STRING,
  start_dt                    STRING OPTIONS(description = 'Oracle string YYYYMMDDHH24MISS (legacy)'),
  end_dt                      STRING OPTIONS(description = 'Oracle string YYYYMMDDHH24MISS (legacy)'),
  billing_model               STRING,
  currency                    STRING,
  signed_dt                   STRING OPTIONS(description = 'Oracle string YYYYMMDDHH24MISS (legacy)'),
  status                      STRING,
  load_date                   DATE
)
PARTITION BY load_date;
