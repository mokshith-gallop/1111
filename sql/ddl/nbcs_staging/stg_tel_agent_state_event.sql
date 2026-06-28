-- stg_tel_agent_state_event: Sqoop mirror of SWITCH.AGENT_STATE_EVENTS (Oracle switchdb01)
-- Source: staging.stg_tel_agent_state_event | Partition: load_date STRING -> DATE
CREATE TABLE stg_tel_agent_state_event (
  state_event_id              INT64,
  agent_id                    INT64,
  state_code                  STRING,
  start_epoch                 INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  end_epoch                   INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  reason_code                 STRING,
  load_date                   DATE
)
PARTITION BY load_date;
