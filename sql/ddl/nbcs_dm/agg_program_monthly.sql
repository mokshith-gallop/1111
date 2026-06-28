-- agg_program_monthly: Monthly program aggregate (WITH ROLLUP)
-- Source: dm.agg_program_monthly
-- Partition: period_month STRING -> ingestion-time _PARTITIONDATE
CREATE TABLE agg_program_monthly (
  client_sk                   INT64,
  program_sk                  INT64,
  line_of_business            STRING,
  interactions                INT64,
  avg_handle_seconds          NUMERIC(8, 2),
  avg_csat                    NUMERIC(5, 2),
  billed_amount               NUMERIC(14, 2),
  grouping_level              INT64,
  period_month                STRING
)
PARTITION BY _PARTITIONDATE;
