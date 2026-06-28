-- dim_shift: Shift dimension from staging.stg_wfm_shift (layer-skip)
-- Source: dm.dim_shift | Unpartitioned, clustered by PK
CREATE TABLE dim_shift (
  shift_sk                    INT64,
  shift_id                    INT64,
  shift_code                  STRING,
  shift_name                  STRING,
  start_hhmm                  STRING,
  end_hhmm                    STRING,
  overnight_flag              BOOL,
  site_code                   STRING
)
CLUSTER BY shift_sk;
