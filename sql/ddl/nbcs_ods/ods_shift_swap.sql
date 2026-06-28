-- ods_shift_swap: Delta-merged from staging.stg_wfm_shift_swap_delta
-- Source: ods.ods_shift_swap
-- Partition: swap_month STRING kept as STRING; ingestion-time _PARTITIONDATE
CREATE TABLE ods_shift_swap (
  swap_id                     INT64,
  requesting_agent_id         INT64,
  accepting_agent_id          INT64,
  schedule_id                 INT64,
  swap_date                   STRING,
  status                      STRING,
  last_change_ts              TIMESTAMP,
  swap_month                  STRING
)
PARTITION BY _PARTITIONDATE;
