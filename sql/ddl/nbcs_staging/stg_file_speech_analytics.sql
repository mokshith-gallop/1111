-- stg_file_speech_analytics: SFTP file feed — speech_analytics (JSON)
-- Source: staging.stg_file_speech_analytics
-- Multi-column Hive partition (client_code, feed_date):
--   feed_date STRING -> DATE (BQ partition column)
--   client_code STRING -> regular column + CLUSTER BY
-- Complex type: keywords ARRAY<STRING> (REPEATED STRING)
CREATE TABLE stg_file_speech_analytics (
  recording_id                STRING,
  call_ref                    STRING,
  analyzed_ms                 INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  sentiment_score             FLOAT64,
  silence_pct                 FLOAT64,
  talk_over_count             INT64,
  keywords                    ARRAY<STRING>,
  client_code                 STRING,
  feed_date                   DATE
)
PARTITION BY feed_date
CLUSTER BY client_code;
