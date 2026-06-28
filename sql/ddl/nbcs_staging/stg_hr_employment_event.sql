-- stg_hr_employment_event: Sqoop mirror of dbo.EMPLOYMENT_EVENTS (SQL Server hrms01)
-- Source: staging.stg_hr_employment_event | Partition: load_date STRING -> DATE
CREATE TABLE stg_hr_employment_event (
  event_id                    INT64,
  agent_id                    INT64,
  event_type                  STRING,
  event_ts                    INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  from_org_unit_id            INT64,
  to_org_unit_id              INT64,
  reason_code                 STRING,
  load_date                   DATE
)
PARTITION BY load_date;
