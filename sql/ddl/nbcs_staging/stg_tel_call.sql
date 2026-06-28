-- stg_tel_call: Sqoop mirror of SWITCH.CALL_DETAIL (Oracle switchdb01)
-- Source: staging.stg_tel_call | Partition: load_date STRING -> DATE
-- Note: Hive CLUSTERED BY (call_id) INTO 16 BUCKETS is NOT carried to BigQuery
-- (Hive hash-bucketing has no BQ equivalent; performance intent met by BQ clustering).
CREATE TABLE stg_tel_call (
  call_id                     INT64,
  ani                         STRING,
  dnis                        STRING,
  queue_id                    INT64,
  agent_id                    INT64,
  program_id                  INT64,
  start_epoch                 INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  answer_epoch                INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  end_epoch                   INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  disposition_code            STRING,
  direction                   STRING,
  recording_id                STRING,
  load_date                   DATE
)
PARTITION BY load_date;
