-- stg_file_telco_invoice: SFTP file feed — telco_invoices (SEQUENCEFILE)
-- Source: staging.stg_file_telco_invoice
-- Multi-column Hive partition (client_code, feed_date):
--   feed_date STRING -> DATE (BQ partition column)
--   client_code STRING -> regular column + CLUSTER BY
CREATE TABLE stg_file_telco_invoice (
  telco_invoice_id            STRING,
  carrier                     STRING,
  circuit_id                  STRING,
  usage_minutes               INT64,
  charge_amount               NUMERIC(12, 2),
  bill_period                 STRING,
  billed_ms                   INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  client_code                 STRING,
  feed_date                   DATE
)
PARTITION BY feed_date
CLUSTER BY client_code;
