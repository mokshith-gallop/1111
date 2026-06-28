-- stg_fin_timesheet_delta: CDC delta feed from dbo.TIMESHEETS (SQL Server findb01)
-- Source: staging.stg_fin_timesheet_delta | Partition: extract_ts STRING -> TIMESTAMP
CREATE TABLE stg_fin_timesheet_delta (
  timesheet_id                INT64,
  agent_id                    INT64,
  work_date                   STRING,
  program_id                  INT64,
  billable_minutes            INT64,
  nonbillable_minutes         INT64,
  approved_flag               BOOL,
  op                          STRING,
  change_ms                   INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  extract_ts                  TIMESTAMP
)
PARTITION BY DATE(extract_ts);
