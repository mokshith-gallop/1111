-- ods_timesheet: Delta-merged from staging.stg_fin_timesheet_delta
-- Source: ods.ods_timesheet
-- Partition: work_month STRING kept as STRING; ingestion-time _PARTITIONDATE
CREATE TABLE ods_timesheet (
  timesheet_id                INT64,
  agent_id                    INT64,
  work_date                   STRING,
  program_id                  INT64,
  billable_minutes            INT64,
  nonbillable_minutes         INT64,
  approved_flag               BOOL,
  last_change_ts              TIMESTAMP,
  work_month                  STRING
)
PARTITION BY _PARTITIONDATE;
