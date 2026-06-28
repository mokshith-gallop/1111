-- ods_attrition_event: Delta-merged from staging.stg_hr_attrition_event_delta
-- Source: ods.ods_attrition_event
-- Partition: event_month STRING kept as STRING; ingestion-time _PARTITIONDATE
CREATE TABLE ods_attrition_event (
  attrition_event_id          INT64,
  agent_id                    INT64,
  notice_ts                   TIMESTAMP,
  last_day                    STRING,
  attrition_type              STRING,
  reason_code                 STRING,
  regrettable_flag            BOOL,
  last_change_ts              TIMESTAMP,
  event_month                 STRING
)
PARTITION BY _PARTITIONDATE;
