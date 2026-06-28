-- agg_queue_hourly: Hourly queue aggregate from fact_queue_interval + stg_wfm_forecast
-- Source: dm.agg_queue_hourly
-- Partition: date_key INT -> ingestion-time _PARTITIONDATE
CREATE TABLE agg_queue_hourly (
  queue_sk                    INT64,
  hour_of_day                 INT64,
  offered                     INT64,
  answered                    INT64,
  abandoned                   INT64,
  sl_pct                      NUMERIC(5, 2),
  forecast_volume             INT64,
  volume_variance_pct         NUMERIC(7, 2),
  date_key                    INT64
)
PARTITION BY _PARTITIONDATE;
