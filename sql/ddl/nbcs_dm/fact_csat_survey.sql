-- fact_csat_survey: CSAT survey fact from ods_survey_response + fact_interaction
-- Source: dm.fact_csat_survey
-- Partition: date_key INT -> ingestion-time _PARTITIONDATE
CREATE TABLE fact_csat_survey (
  survey_id                   STRING,
  interaction_id              STRING,
  client_sk                   INT64,
  program_sk                  INT64,
  agent_sk                    INT64,
  survey_ts                   TIMESTAMP,
  csat_score                  INT64,
  nps_score                   INT64,
  fcr_claimed                 BOOL,
  date_key                    INT64
)
PARTITION BY _PARTITIONDATE;
