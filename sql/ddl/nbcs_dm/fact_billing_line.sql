-- fact_billing_line: Billing line fact from ods_invoice_acid + stg_fin_invoice_line + ods_rate_card
-- Source: dm.fact_billing_line
-- Partition: period_month STRING -> ingestion-time _PARTITIONDATE
-- Clustering: client_sk, program_sk (locked Performance Optimization matrix)
CREATE TABLE fact_billing_line (
  invoice_line_id             INT64,
  invoice_id                  INT64,
  client_sk                   INT64,
  program_sk                  INT64,
  service_code                STRING,
  qty                         NUMERIC(12, 2),
  unit_rate                   NUMERIC(12, 4),
  line_amount                 NUMERIC(14, 2),
  adjustment_flag             BOOL,
  invoice_status              STRING,
  period_month                STRING
)
PARTITION BY _PARTITIONDATE
CLUSTER BY client_sk, program_sk;
