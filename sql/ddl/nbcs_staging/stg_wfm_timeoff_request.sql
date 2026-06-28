-- stg_wfm_timeoff_request: Sqoop mirror of wfm.timeoff_requests (MySQL wfm01)
-- Source: staging.stg_wfm_timeoff_request | Partition: load_date STRING -> DATE
CREATE TABLE stg_wfm_timeoff_request (
  timeoff_id                  INT64,
  agent_id                    INT64,
  request_epoch               INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  start_date                  STRING,
  end_date                    STRING,
  timeoff_type                STRING,
  status                      STRING,
  load_date                   DATE
)
PARTITION BY load_date;
