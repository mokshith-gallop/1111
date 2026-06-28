-- stg_fin_payroll_adj_delta: CDC delta feed from dbo.PAYROLL_ADJUSTMENTS (SQL Server findb01)
-- Source: staging.stg_fin_payroll_adj_delta | Partition: extract_ts STRING -> TIMESTAMP
CREATE TABLE stg_fin_payroll_adj_delta (
  adjustment_id               INT64,
  agent_id                    INT64,
  period_month                STRING,
  adj_type                    STRING,
  amount                      NUMERIC(12, 2),
  op                          STRING,
  change_ms                   INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  extract_ts                  TIMESTAMP
)
PARTITION BY DATE(extract_ts);
