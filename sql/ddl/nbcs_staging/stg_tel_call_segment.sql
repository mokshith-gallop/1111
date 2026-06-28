-- stg_tel_call_segment: Sqoop mirror of SWITCH.CALL_SEGMENTS (Oracle switchdb01)
-- Source: staging.stg_tel_call_segment | Partition: load_date STRING -> DATE
CREATE TABLE stg_tel_call_segment (
  segment_id                  INT64,
  call_id                     INT64,
  segment_no                  INT64,
  segment_type                STRING,
  start_epoch                 INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  end_epoch                   INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  agent_id                    INT64,
  load_date                   DATE
)
PARTITION BY load_date;
