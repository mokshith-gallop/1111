-- stg_hr_skill: Sqoop mirror of dbo.SKILLS (SQL Server hrms01)
-- Source: staging.stg_hr_skill | Partition: load_date STRING -> DATE
CREATE TABLE stg_hr_skill (
  skill_id                    INT64,
  skill_code                  STRING,
  skill_name                  STRING,
  skill_family                STRING,
  created_ts                  INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
