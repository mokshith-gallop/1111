-- stg_fin_invoice: Sqoop mirror of dbo.INVOICES (SQL Server findb01)
-- Source: staging.stg_fin_invoice | Partition: load_date STRING -> DATE
-- WARNING: issued_ts_sec and due_ts_sec column NAMES suggest seconds but
-- VALUES ARE EPOCH MILLISECONDS — see EPOCH-POLICY.md
CREATE TABLE stg_fin_invoice (
  invoice_id                  INT64,
  invoice_no                  STRING,
  client_id                   INT64,
  program_id                  INT64,
  period_month                STRING,
  issued_ts_sec               INT64 OPTIONS(description = 'WARNING: column name says seconds but VALUES ARE EPOCH MILLISECONDS - see EPOCH-POLICY.md'),
  due_ts_sec                  INT64 OPTIONS(description = 'WARNING: column name says seconds but VALUES ARE EPOCH MILLISECONDS - see EPOCH-POLICY.md'),
  currency                    STRING,
  total_amount                NUMERIC(14, 2),
  status                      STRING,
  load_date                   DATE
)
PARTITION BY load_date;
