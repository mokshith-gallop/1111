-- ods_ivr_session: Cleansed from staging.stg_file_ivr_logs
-- Source: ods.ods_ivr_session | Partition: event_date STRING -> DATE
CREATE TABLE ods_ivr_session (
  session_ref                 STRING,
  client_code                 STRING,
  first_event_ts              TIMESTAMP,
  last_event_ts               TIMESTAMP,
  menu_path_full              STRING,
  hops                        INT64,
  contained_flag              BOOL,
  exit_key                    STRING,
  event_date                  DATE
)
PARTITION BY event_date;
