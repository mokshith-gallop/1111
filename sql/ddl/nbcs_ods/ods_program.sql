-- ods_program: Cleansed from staging.stg_crm_program
-- Source: ods.ods_program | Partition: snapshot_date STRING -> DATE
CREATE TABLE ods_program (
  program_id                  INT64,
  client_id                   INT64,
  program_code                STRING,
  program_name                STRING,
  line_of_business            STRING,
  channel_mix                 STRING,
  site_code                   STRING,
  status                      STRING,
  go_live_ts                  TIMESTAMP,
  updated_ts                  TIMESTAMP,
  snapshot_date               DATE
)
PARTITION BY snapshot_date;
