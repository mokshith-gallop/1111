-- dim_client: Client dimension from ods_client_acid + stg_crm_client_contact
-- Source: dm.dim_client | Unpartitioned, clustered by PK
CREATE TABLE dim_client (
  client_sk                   INT64,
  client_id                   INT64,
  client_code                 STRING,
  client_name                 STRING,
  industry                    STRING,
  hq_country                  STRING,
  primary_contact_name        STRING,
  primary_contact_email       STRING,
  status                      STRING
)
CLUSTER BY client_sk;
