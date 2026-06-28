-- stg_file_ivr_logs: SFTP file feed — ivr_logs (RegexSerDe)
-- Source: staging.stg_file_ivr_logs
-- Multi-column Hive partition (client_code, feed_date):
--   feed_date STRING -> DATE (BQ partition column)
--   client_code STRING -> regular column + CLUSTER BY
CREATE TABLE stg_file_ivr_logs (
  event_ms                    INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  session_ref                 STRING,
  menu_path                   STRING,
  key_pressed                 STRING,
  raw_tail                    STRING,
  client_code                 STRING,
  feed_date                   DATE
)
PARTITION BY feed_date
CLUSTER BY client_code;
