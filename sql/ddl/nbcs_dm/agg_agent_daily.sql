-- agg_agent_daily: Daily agent aggregate from fact_interaction + fact_agent_activity + fact_adherence_daily
-- Source: dm.agg_agent_daily
-- Partition: date_key INT -> ingestion-time _PARTITIONDATE
-- Clustering: agent_sk, site_code (locked Performance Optimization matrix)
CREATE TABLE agg_agent_daily (
  agent_sk                    INT64,
  site_code                   STRING,
  interactions_handled        INT64,
  avg_handle_seconds          NUMERIC(8, 2),
  talk_seconds                INT64,
  acw_seconds                 INT64,
  aux_seconds                 INT64,
  adherence_pct               NUMERIC(5, 2),
  occupancy_pct               NUMERIC(5, 2),
  date_key                    INT64
)
PARTITION BY _PARTITIONDATE
CLUSTER BY agent_sk, site_code;
