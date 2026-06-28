-- ods_agent_scd2: SCD-2 history from staging.stg_hr_agent + stg_hr_employment_event
-- Source: ods.ods_agent_scd2
-- Partition: eff_from_year INT -> INT64 integer-range partition
CREATE TABLE ods_agent_scd2 (
  agent_history_id            STRING,
  agent_id                    INT64,
  employee_no                 STRING,
  org_unit_id                 INT64,
  job_grade                   STRING,
  employment_type             STRING,
  status                      STRING,
  eff_from_ts                 TIMESTAMP,
  eff_to_ts                   TIMESTAMP,
  is_current                  BOOL,
  eff_from_year               INT64
)
PARTITION BY RANGE_BUCKET(eff_from_year, GENERATE_ARRAY(2020, 2030, 1));
