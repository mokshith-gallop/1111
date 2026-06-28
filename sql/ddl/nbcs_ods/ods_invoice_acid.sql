-- ods_invoice_acid: ACID transactional table from staging.stg_fin_invoice
-- Source: ods.ods_invoice_acid | Unpartitioned (small master table)
-- Hive CLUSTERED BY (invoice_id) INTO 4 BUCKETS + transactional='true' NOT carried
CREATE TABLE ods_invoice_acid (
  invoice_id                  INT64,
  invoice_no                  STRING,
  client_id                   INT64,
  program_id                  INT64,
  period_month                STRING,
  issued_ts                   TIMESTAMP,
  due_ts                      TIMESTAMP,
  currency                    STRING,
  total_amount                NUMERIC(14, 2),
  status                      STRING
);
