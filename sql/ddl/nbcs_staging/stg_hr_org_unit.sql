-- stg_hr_org_unit: Sqoop mirror of dbo.ORG_UNITS (SQL Server hrms01)
-- Source: staging.stg_hr_org_unit | Partition: load_date STRING -> DATE
CREATE TABLE stg_hr_org_unit (
  org_unit_id                 INT64,
  parent_unit_id              INT64,
  unit_code                   STRING,
  unit_name                   STRING,
  unit_type                   STRING,
  site_code                   STRING,
  cost_center                 STRING,
  created_ts                  INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
