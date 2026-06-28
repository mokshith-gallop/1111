-- stg_file_survey_csat: SFTP file feed — surveys
-- Source: staging.stg_file_survey_csat
-- Multi-column Hive partition (client_code, feed_date):
--   feed_date STRING -> DATE (BQ partition column)
--   client_code STRING -> regular column + CLUSTER BY
CREATE TABLE stg_file_survey_csat (
  survey_id                   STRING,
  interaction_ref             STRING,
  survey_ms                   INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  csat_score                  INT64,
  nps_score                   INT64,
  fcr_claimed                 BOOL,
  verbatim                    STRING,
  client_code                 STRING,
  feed_date                   DATE
)
PARTITION BY feed_date
CLUSTER BY client_code;
