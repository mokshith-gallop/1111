-- ods_contract: Cleansed from staging.stg_crm_contract
-- Source: ods.ods_contract | Partition: snapshot_date STRING -> DATE
CREATE TABLE ods_contract (
  contract_id                 INT64,
  client_id                   INT64,
  program_id                  INT64,
  contract_no                 STRING,
  start_ts                    TIMESTAMP,
  end_ts                      TIMESTAMP,
  billing_model               STRING,
  currency                    STRING,
  signed_ts                   TIMESTAMP,
  status                      STRING,
  snapshot_date               DATE
)
PARTITION BY snapshot_date;
