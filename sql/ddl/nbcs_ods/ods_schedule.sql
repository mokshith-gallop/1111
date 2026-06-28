-- ods_schedule: Cleansed from staging.stg_wfm_schedule + stg_wfm_shift
-- Source: ods.ods_schedule | Partition: sched_date STRING -> DATE
CREATE TABLE ods_schedule (
  schedule_id                 INT64,
  agent_id                    INT64,
  shift_id                    INT64,
  shift_code                  STRING,
  start_ts                    TIMESTAMP,
  end_ts                      TIMESTAMP,
  paid_minutes                INT64,
  activity_code               STRING,
  site_code                   STRING,
  sched_date                  DATE
)
PARTITION BY sched_date;
