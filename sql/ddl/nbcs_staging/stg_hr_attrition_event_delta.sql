-- stg_hr_attrition_event_delta: CDC delta feed from dbo.ATTRITION_EVENTS (SQL Server hrms01)
-- Source: staging.stg_hr_attrition_event_delta | Partition: extract_ts STRING -> TIMESTAMP
CREATE TABLE stg_hr_attrition_event_delta (
  attrition_event_id          INT64,
  agent_id                    INT64,
  notice_epoch                INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  last_day                    STRING,
  attrition_type              STRING,
  reason_code                 STRING,
  regrettable_flag            BOOL,
  op                          STRING,
  change_ms                   INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  extract_ts                  TIMESTAMP
)
PARTITION BY DATE(extract_ts);
