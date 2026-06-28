-- stg_file_chat_transcripts: SFTP file feed — chat_transcripts (JSON)
-- Source: staging.stg_file_chat_transcripts
-- Multi-column Hive partition (client_code, feed_date):
--   feed_date STRING -> DATE (BQ partition column)
--   client_code STRING -> regular column + CLUSTER BY
-- Complex types:
--   messages ARRAY<STRUCT<sender STRING, ts_ms INT64, text STRING>> (Hive BIGINT -> INT64)
--   metadata MAP<STRING,STRING> -> ARRAY<STRUCT<key STRING, value STRING>>
CREATE TABLE stg_file_chat_transcripts (
  chat_ref                    STRING,
  queue_code                  STRING,
  agent_email                 STRING,
  started_ms                  INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  ended_ms                    INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  messages                    ARRAY<STRUCT<sender STRING, ts_ms INT64, text STRING>>,
  metadata                    ARRAY<STRUCT<key STRING, value STRING>>,
  client_code                 STRING,
  feed_date                   DATE
)
PARTITION BY feed_date
CLUSTER BY client_code;
