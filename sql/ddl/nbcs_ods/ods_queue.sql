-- ods_queue: Cleansed from staging.stg_tel_queue
-- Source: ods.ods_queue | Partition: snapshot_date STRING -> DATE
CREATE TABLE ods_queue (
  queue_id                    INT64,
  queue_code                  STRING,
  queue_name                  STRING,
  program_id                  INT64,
  media_type                  STRING,
  priority                    INT64,
  created_ts                  TIMESTAMP,
  snapshot_date               DATE
)
PARTITION BY snapshot_date;
