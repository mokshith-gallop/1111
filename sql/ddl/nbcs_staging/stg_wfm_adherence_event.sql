-- stg_wfm_adherence_event: Sqoop mirror of wfm.adherence_events (MySQL wfm01)
-- Source: staging.stg_wfm_adherence_event | Partition: load_date STRING -> DATE
CREATE TABLE stg_wfm_adherence_event (
  adherence_event_id          INT64,
  agent_id                    INT64,
  schedule_id                 INT64,
  exception_type              STRING,
  start_epoch                 INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  end_epoch                   INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  approved_flag               BOOL,
  load_date                   DATE
)
PARTITION BY load_date;
