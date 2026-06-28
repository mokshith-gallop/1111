-- dim_agent: Agent dimension from ods_agent_scd2 + ods_agent_acid + ods_org_unit
-- Source: dm.dim_agent | Unpartitioned, clustered by PK
CREATE TABLE dim_agent (
  agent_sk                    INT64,
  agent_id                    INT64,
  employee_no                 STRING,
  full_name                   STRING,
  job_grade                   STRING,
  employment_type             STRING,
  org_unit_id                 INT64,
  team_name                   STRING,
  site_code                   STRING,
  status                      STRING,
  hire_date_key               INT64,
  is_current                  BOOL
)
CLUSTER BY agent_sk;
