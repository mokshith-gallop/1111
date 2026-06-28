-- ods_org_unit: Cleansed from staging.stg_hr_org_unit
-- Source: ods.ods_org_unit | Partition: snapshot_date STRING -> DATE
CREATE TABLE ods_org_unit (
  org_unit_id                 INT64,
  parent_unit_id              INT64,
  unit_code                   STRING,
  unit_name                   STRING,
  unit_type                   STRING,
  site_code                   STRING,
  cost_center                 STRING,
  created_ts                  TIMESTAMP,
  snapshot_date               DATE
)
PARTITION BY snapshot_date;
