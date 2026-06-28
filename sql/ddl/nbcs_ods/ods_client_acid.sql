-- ods_client_acid: ACID transactional table from staging.stg_crm_client
-- Source: ods.ods_client_acid | Unpartitioned (small master table)
-- Hive CLUSTERED BY (client_id) INTO 4 BUCKETS + transactional='true' NOT carried
CREATE TABLE ods_client_acid (
  client_id                   INT64,
  client_code                 STRING,
  client_name                 STRING,
  industry                    STRING,
  hq_country                  STRING,
  status                      STRING,
  created_ts                  TIMESTAMP,
  updated_ts                  TIMESTAMP
);
