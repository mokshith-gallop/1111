-- stg_crm_program: Sqoop mirror of CRM.PROGRAMS (Oracle crmdb01)
-- Source: staging.stg_crm_program | Partition: load_date STRING -> DATE
CREATE TABLE stg_crm_program (
  program_id                  INT64,
  client_id                   INT64,
  program_code                STRING,
  program_name                STRING,
  line_of_business            STRING,
  channel_mix                 STRING,
  site_code                   STRING,
  status                      STRING,
  go_live_ts                  INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  updated_ts                  INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
