-- stg_tel_queue: Sqoop mirror of SWITCH.QUEUES (Oracle switchdb01)
-- Source: staging.stg_tel_queue | Partition: load_date STRING -> DATE
CREATE TABLE stg_tel_queue (
  queue_id                    INT64,
  queue_code                  STRING,
  queue_name                  STRING,
  program_id                  INT64,
  media_type                  STRING,
  priority                    INT64,
  created_epoch               INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
