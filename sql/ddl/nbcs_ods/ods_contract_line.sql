-- ods_contract_line: Cleansed from staging.stg_crm_contract_line
-- Source: ods.ods_contract_line | Partition: snapshot_date STRING -> DATE
CREATE TABLE ods_contract_line (
  contract_line_id            INT64,
  contract_id                 INT64,
  line_no                     INT64,
  service_code                STRING,
  uom                         STRING,
  unit_rate                   NUMERIC(12, 4),
  min_commit                  NUMERIC(12, 2),
  effective_ts                TIMESTAMP,
  snapshot_date               DATE
)
PARTITION BY snapshot_date;
