-- ods_dialer_attempt: Cleansed from staging.stg_file_dialer_result
-- Source: ods.ods_dialer_attempt | Partition: event_date STRING -> DATE
CREATE TABLE ods_dialer_attempt (
  attempt_id                  STRING,
  client_code                 STRING,
  campaign_code               STRING,
  agent_id                    INT64,
  attempt_ts                  TIMESTAMP,
  result_code                 STRING,
  connected_flag              BOOL,
  talk_seconds                INT64,
  event_date                  DATE
)
PARTITION BY event_date;
