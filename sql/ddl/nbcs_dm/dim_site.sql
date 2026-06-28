-- dim_site: Site dimension from ods_org_unit
-- Source: dm.dim_site | Unpartitioned, clustered by PK
CREATE TABLE dim_site (
  site_sk                     INT64,
  site_code                   STRING,
  site_name                   STRING,
  region                      STRING,
  country                     STRING,
  timezone                    STRING
)
CLUSTER BY site_sk;
