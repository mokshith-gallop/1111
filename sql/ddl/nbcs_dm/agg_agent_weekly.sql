-- agg_agent_weekly: Weekly agent aggregate from agg_agent_daily
-- Source: dm.agg_agent_weekly
-- Partition: week_start_key INT -> ingestion-time _PARTITIONDATE
CREATE TABLE agg_agent_weekly (
  agent_sk                    INT64,
  site_code                   STRING,
  days_worked                 INT64,
  interactions_handled        INT64,
  avg_handle_seconds          NUMERIC(8, 2),
  adherence_pct               NUMERIC(5, 2),
  occupancy_pct               NUMERIC(5, 2),
  week_start_key              INT64
)
PARTITION BY _PARTITIONDATE;
