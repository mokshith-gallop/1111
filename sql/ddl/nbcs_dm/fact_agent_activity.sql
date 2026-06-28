-- fact_agent_activity: Agent state activity from stg_tel_agent_state_event + ods_adherence_event
-- Source: dm.fact_agent_activity
-- Partition: date_key INT -> ingestion-time _PARTITIONDATE
CREATE TABLE fact_agent_activity (
  agent_sk                    INT64,
  state_code                  STRING,
  state_seconds               INT64,
  occurrence_count            INT64,
  first_state_ts              TIMESTAMP,
  last_state_ts               TIMESTAMP,
  date_key                    INT64
)
PARTITION BY _PARTITIONDATE;
