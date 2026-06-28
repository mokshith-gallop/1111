-- fact_interaction: Core interaction fact from ods_interaction + dim lookups
-- Source: dm.fact_interaction
-- Hive multi-col partition (date_key INT, channel STRING) collapsed:
--   date_key INT -> stays as regular column; ingestion-time _PARTITIONDATE
--   channel STRING -> moves to CLUSTER BY
-- Hive CLUSTERED BY (agent_sk) INTO 16 BUCKETS NOT carried
-- BQ clustering: channel + agent_sk + program_sk (locked Performance Optimization matrix)
CREATE TABLE fact_interaction (
  interaction_id              STRING,
  client_sk                   INT64,
  program_sk                  INT64,
  queue_sk                    INT64,
  agent_sk                    INT64,
  customer_ref                STRING,
  start_ts                    TIMESTAMP,
  end_ts                      TIMESTAMP,
  handle_seconds              INT64,
  resolved_flag               BOOL,
  source_system               STRING,
  date_key                    INT64,
  channel                     STRING
)
PARTITION BY _PARTITIONDATE
CLUSTER BY channel, agent_sk, program_sk;
