-- ods_agent_skill_scd2: SCD-2 history from staging.stg_hr_agent_skill + stg_hr_skill
-- Source: ods.ods_agent_skill_scd2
-- Partition: eff_from_year INT -> INT64 integer-range partition
CREATE TABLE ods_agent_skill_scd2 (
  agent_skill_history_id      STRING,
  agent_id                    INT64,
  skill_id                    INT64,
  skill_code                  STRING,
  proficiency                 INT64,
  certified                   BOOL,
  eff_from_ts                 TIMESTAMP,
  eff_to_ts                   TIMESTAMP,
  is_current                  BOOL,
  eff_from_year               INT64
)
PARTITION BY RANGE_BUCKET(eff_from_year, GENERATE_ARRAY(2020, 2030, 1));
