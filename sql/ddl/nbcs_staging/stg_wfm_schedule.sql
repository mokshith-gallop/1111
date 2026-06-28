-- stg_wfm_schedule: Sqoop mirror of wfm.schedules (MySQL wfm01)
-- Source: staging.stg_wfm_schedule
-- Multi-column Hive partition (load_date, site_code):
--   load_date STRING -> DATE (BQ partition column)
--   site_code STRING -> regular column (demoted from Hive partition)
CREATE TABLE stg_wfm_schedule (
  schedule_id                 INT64,
  agent_id                    INT64,
  shift_id                    INT64,
  sched_date                  STRING,
  start_epoch                 INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  end_epoch                   INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  paid_minutes                INT64,
  activity_code               STRING,
  site_code                   STRING,
  load_date                   DATE
)
PARTITION BY load_date;
