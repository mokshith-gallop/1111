-- fact_adherence_daily: Daily adherence fact from ods_schedule + ods_adherence_event
-- Source: dm.fact_adherence_daily
-- Partition: date_key INT -> ingestion-time _PARTITIONDATE
CREATE TABLE fact_adherence_daily (
  agent_sk                    INT64,
  scheduled_minutes           INT64,
  worked_minutes              INT64,
  exception_minutes           INT64,
  timeoff_minutes             INT64,
  adherence_pct               NUMERIC(5, 2),
  occupancy_pct               NUMERIC(5, 2),
  date_key                    INT64
)
PARTITION BY _PARTITIONDATE;
