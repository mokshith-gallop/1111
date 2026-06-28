-- ods_rate_card: Delta-merged from staging.stg_fin_rate_card + stg_fin_rate_card_change_delta
-- Source: ods.ods_rate_card | Partition: snapshot_date STRING -> DATE
CREATE TABLE ods_rate_card (
  rate_card_id                INT64,
  program_id                  INT64,
  service_code                STRING,
  rate                        NUMERIC(12, 4),
  currency                    STRING,
  effective_ts                TIMESTAMP,
  expiry_ts                   TIMESTAMP,
  last_change_ts              TIMESTAMP,
  snapshot_date               DATE
)
PARTITION BY snapshot_date;
