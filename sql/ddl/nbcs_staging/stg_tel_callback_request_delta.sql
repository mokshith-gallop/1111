-- stg_tel_callback_request_delta: CDC delta feed from SWITCH.CALLBACK_REQUESTS (Oracle switchdb01)
-- Source: staging.stg_tel_callback_request_delta | Partition: extract_ts STRING -> TIMESTAMP
CREATE TABLE stg_tel_callback_request_delta (
  callback_id                 INT64,
  call_id                     INT64,
  queue_id                    INT64,
  requested_epoch             INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  scheduled_epoch             INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  completed_flag              BOOL,
  op                          STRING,
  change_ms                   INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  extract_ts                  TIMESTAMP
)
PARTITION BY DATE(extract_ts);
