-- agg_billing_monthly: Monthly billing aggregate from fact_billing_line + ods_sla_credit
-- Source: dm.agg_billing_monthly
-- Partition: period_month STRING -> ingestion-time _PARTITIONDATE
CREATE TABLE agg_billing_monthly (
  client_sk                   INT64,
  program_sk                  INT64,
  billed_amount               NUMERIC(14, 2),
  sla_credit_amount           NUMERIC(12, 2),
  telco_cost_amount           NUMERIC(12, 2),
  net_revenue                 NUMERIC(14, 2),
  period_month                STRING
)
PARTITION BY _PARTITIONDATE;
