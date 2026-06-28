-- stg_hr_agent: Sqoop mirror of dbo.AGENTS (SQL Server hrms01)
-- Source: staging.stg_hr_agent | Partition: load_date STRING -> DATE
CREATE TABLE stg_hr_agent (
  agent_id                    INT64,
  employee_no                 STRING,
  first_name                  STRING,
  last_name                   STRING,
  email                       STRING,
  org_unit_id                 INT64,
  job_grade                   STRING,
  employment_type             STRING,
  hire_ts                     INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  term_ts                     INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  status                      STRING,
  load_date                   DATE
)
PARTITION BY load_date;
