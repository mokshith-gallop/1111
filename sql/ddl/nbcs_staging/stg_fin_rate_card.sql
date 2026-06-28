-- stg_fin_rate_card: Sqoop mirror of dbo.RATE_CARDS (SQL Server findb01)
-- Source: staging.stg_fin_rate_card | Partition: load_date STRING -> DATE
CREATE TABLE stg_fin_rate_card (
  rate_card_id                INT64,
  program_id                  INT64,
  service_code                STRING,
  rate                        NUMERIC(12, 4),
  currency                    STRING,
  effective_ts                INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  expiry_ts                   INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
