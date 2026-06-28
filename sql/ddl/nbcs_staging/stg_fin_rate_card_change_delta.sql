-- stg_fin_rate_card_change_delta: CDC delta feed from dbo.RATE_CARD_CHANGES (SQL Server findb01)
-- Source: staging.stg_fin_rate_card_change_delta | Partition: extract_ts STRING -> TIMESTAMP
CREATE TABLE stg_fin_rate_card_change_delta (
  rate_change_id              INT64,
  rate_card_id                INT64,
  old_rate                    NUMERIC(12, 4),
  new_rate                    NUMERIC(12, 4),
  change_reason               STRING,
  op                          STRING,
  change_ms                   INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  extract_ts                  TIMESTAMP
)
PARTITION BY DATE(extract_ts);
