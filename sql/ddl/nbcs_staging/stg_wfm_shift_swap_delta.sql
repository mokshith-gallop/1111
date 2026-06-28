-- stg_wfm_shift_swap_delta: CDC delta feed from wfm.shift_swaps (MySQL wfm01)
-- Source: staging.stg_wfm_shift_swap_delta | Partition: extract_ts STRING -> TIMESTAMP
CREATE TABLE stg_wfm_shift_swap_delta (
  swap_id                     INT64,
  requesting_agent_id         INT64,
  accepting_agent_id          INT64,
  schedule_id                 INT64,
  swap_date                   STRING,
  status                      STRING,
  op                          STRING,
  change_ms                   INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  extract_ts                  TIMESTAMP
)
PARTITION BY DATE(extract_ts);
