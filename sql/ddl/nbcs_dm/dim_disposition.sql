-- dim_disposition: Disposition dimension from staging.stg_tel_disposition_code (layer-skip)
-- Source: dm.dim_disposition | Unpartitioned, clustered by PK
CREATE TABLE dim_disposition (
  disposition_sk              INT64,
  disposition_code            STRING,
  disposition_desc            STRING,
  category                    STRING,
  billable_flag               BOOL
)
CLUSTER BY disposition_sk;
