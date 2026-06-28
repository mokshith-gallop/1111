-- dim_org: Organization hierarchy dimension from ods_org_unit
-- Source: dm.dim_org | Unpartitioned, clustered by PK
CREATE TABLE dim_org (
  org_sk                      INT64,
  org_unit_id                 INT64,
  unit_code                   STRING,
  unit_name                   STRING,
  unit_type                   STRING,
  level1_name                 STRING,
  level2_name                 STRING,
  level3_name                 STRING,
  level4_name                 STRING,
  site_code                   STRING,
  cost_center                 STRING
)
CLUSTER BY org_sk;
