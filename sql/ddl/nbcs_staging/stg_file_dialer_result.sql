-- stg_file_dialer_result: SFTP file feed — dialer_results (RCFILE)
-- Source: staging.stg_file_dialer_result
-- Multi-column Hive partition (client_code, feed_date):
--   feed_date STRING -> DATE (BQ partition column)
--   client_code STRING -> regular column + CLUSTER BY
CREATE TABLE stg_file_dialer_result (
  attempt_id                  STRING,
  campaign_code               STRING,
  phone_hash                  STRING,
  agent_id                    INT64,
  attempt_ms                  INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  result_code                 STRING,
  talk_seconds                INT64,
  client_code                 STRING,
  feed_date                   DATE
)
PARTITION BY feed_date
CLUSTER BY client_code;
