-- stg_hr_agent_skill: Sqoop mirror of dbo.AGENT_SKILLS (SQL Server hrms01)
-- Source: staging.stg_hr_agent_skill | Partition: load_date STRING -> DATE
CREATE TABLE stg_hr_agent_skill (
  agent_skill_id              INT64,
  agent_id                    INT64,
  skill_id                    INT64,
  proficiency                 INT64,
  certified                   BOOL,
  effective_ts                INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  expiry_ts                   INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
