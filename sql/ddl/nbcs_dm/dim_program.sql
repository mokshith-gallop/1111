-- dim_program: Program dimension from ods_program + ods_contract
-- Source: dm.dim_program | Unpartitioned, clustered by PK
CREATE TABLE dim_program (
  program_sk                  INT64,
  program_id                  INT64,
  program_code                STRING,
  program_name                STRING,
  client_id                   INT64,
  line_of_business            STRING,
  channel_mix                 STRING,
  site_code                   STRING,
  billing_model               STRING,
  status                      STRING,
  go_live_date_key            INT64
)
CLUSTER BY program_sk;
