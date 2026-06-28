-- ods_survey_response: Cleansed from staging.stg_file_survey_csat
-- Source: ods.ods_survey_response | Partition: event_date STRING -> DATE
CREATE TABLE ods_survey_response (
  survey_id                   STRING,
  client_code                 STRING,
  interaction_ref             STRING,
  survey_ts                   TIMESTAMP,
  csat_score                  INT64,
  nps_score                   INT64,
  fcr_claimed                 BOOL,
  verbatim                    STRING,
  event_date                  DATE
)
PARTITION BY event_date;
