-- stg_crm_client: Sqoop mirror of CRM.CLIENTS (Oracle crmdb01)
-- Source: staging.stg_crm_client | Partition: load_date STRING -> DATE
CREATE TABLE stg_crm_client (
  client_id                   INT64,
  client_code                 STRING,
  client_name                 STRING,
  industry                    STRING,
  hq_country                  STRING,
  status                      STRING,
  created_ts                  INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  updated_ts                  INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
