-- ods_call: Cleansed from staging.stg_tel_call + stg_tel_call_segment
-- Source: ods.ods_call | Partition: call_date STRING -> DATE
CREATE TABLE ods_call (
  call_id                     INT64,
  queue_id                    INT64,
  agent_id                    INT64,
  program_id                  INT64,
  direction                   STRING,
  start_ts                    TIMESTAMP,
  answer_ts                   TIMESTAMP,
  end_ts                      TIMESTAMP,
  ring_seconds                INT64,
  talk_seconds                INT64,
  hold_seconds                INT64,
  acw_seconds                 INT64,
  abandoned_flag              BOOL,
  disposition_code            STRING,
  recording_id                STRING,
  call_date                   DATE
)
PARTITION BY call_date;
