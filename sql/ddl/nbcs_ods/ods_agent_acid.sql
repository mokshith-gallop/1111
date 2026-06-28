-- ods_agent_acid: ACID transactional table from staging.stg_hr_agent + stg_hr_employment_event
-- Source: ods.ods_agent_acid | Unpartitioned (small master table)
-- Hive CLUSTERED BY (agent_id) INTO 8 BUCKETS + transactional='true' NOT carried
CREATE TABLE ods_agent_acid (
  agent_id                    INT64,
  employee_no                 STRING,
  full_name                   STRING,
  email                       STRING,
  org_unit_id                 INT64,
  job_grade                   STRING,
  employment_type             STRING,
  hire_ts                     TIMESTAMP,
  term_ts                     TIMESTAMP,
  status                      STRING
);
