-- fact_queue_interval: Queue interval metrics from ods_call + dim_queue + stg_crm_sla_target
-- Source: dm.fact_queue_interval
-- Partition: date_key INT -> ingestion-time _PARTITIONDATE
-- Clustering: queue_sk (locked Performance Optimization matrix)
CREATE TABLE fact_queue_interval (
  queue_sk                    INT64,
  interval_start_ts           TIMESTAMP,
  offered                     INT64,
  answered                    INT64,
  abandoned                   INT64,
  answered_in_sl              INT64,
  sl_threshold_sec            INT64,
  avg_speed_answer_sec        NUMERIC(8, 2),
  avg_handle_sec              NUMERIC(8, 2),
  date_key                    INT64
)
PARTITION BY _PARTITIONDATE
CLUSTER BY queue_sk;
