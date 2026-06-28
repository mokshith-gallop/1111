-- ods_agent_assignment_scd2: SCD-2 history from staging.stg_hr_agent + ods_program + ods_queue
-- Source: ods.ods_agent_assignment_scd2
-- Partition: eff_from_year INT -> INT64 integer-range partition
CREATE TABLE ods_agent_assignment_scd2 (
  assignment_history_id       STRING,
  agent_id                    INT64,
  program_id                  INT64,
  queue_id                    INT64,
  role_on_program             STRING,
  eff_from_ts                 TIMESTAMP,
  eff_to_ts                   TIMESTAMP,
  is_current                  BOOL,
  eff_from_year               INT64
)
PARTITION BY RANGE_BUCKET(eff_from_year, GENERATE_ARRAY(2020, 2030, 1));
