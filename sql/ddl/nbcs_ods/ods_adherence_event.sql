-- ods_adherence_event: Cleansed from staging.stg_wfm_adherence_event
-- Source: ods.ods_adherence_event | Partition: event_date STRING -> DATE
CREATE TABLE ods_adherence_event (
  adherence_event_id          INT64,
  agent_id                    INT64,
  schedule_id                 INT64,
  exception_type              STRING,
  start_ts                    TIMESTAMP,
  end_ts                      TIMESTAMP,
  exception_minutes           INT64,
  approved_flag               BOOL,
  event_date                  DATE
)
PARTITION BY event_date;
