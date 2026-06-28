-- stg_fin_invoice_line: Sqoop mirror of dbo.INVOICE_LINES (SQL Server findb01)
-- Source: staging.stg_fin_invoice_line | Partition: load_date STRING -> DATE
CREATE TABLE stg_fin_invoice_line (
  invoice_line_id             INT64,
  invoice_id                  INT64,
  contract_line_id            INT64,
  qty                         NUMERIC(12, 2),
  unit_rate                   NUMERIC(12, 4),
  line_amount                 NUMERIC(14, 2),
  adjustment_flag             BOOL,
  created_ms                  INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
