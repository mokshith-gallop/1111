-- ods_callback_request: Delta-merged from staging.stg_tel_callback_request_delta
-- Source: ods.ods_callback_request | Partition: event_date STRING -> DATE
CREATE TABLE ods_callback_request (
  callback_id                 INT64,
  call_id                     INT64,
  queue_id                    INT64,
  requested_ts                TIMESTAMP,
  scheduled_ts                TIMESTAMP,
  completed_flag              BOOL,
  last_change_ts              TIMESTAMP,
  event_date                  DATE
)
PARTITION BY event_date;
