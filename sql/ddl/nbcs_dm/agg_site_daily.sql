-- agg_site_daily: Daily site aggregate from agg_agent_daily + fact_queue_interval + dim_site
-- Source: dm.agg_site_daily
-- Partition: date_key INT -> ingestion-time _PARTITIONDATE
CREATE TABLE agg_site_daily (
  site_code                   STRING,
  agents_active               INT64,
  interactions                INT64,
  avg_handle_seconds          NUMERIC(8, 2),
  sl_pct                      NUMERIC(5, 2),
  adherence_pct               NUMERIC(5, 2),
  date_key                    INT64
)
PARTITION BY _PARTITIONDATE;
