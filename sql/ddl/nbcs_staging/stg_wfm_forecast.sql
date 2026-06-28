-- stg_wfm_forecast: Sqoop mirror of wfm.interval_forecasts (MySQL wfm01)
-- Source: staging.stg_wfm_forecast | Partition: load_date STRING -> DATE
CREATE TABLE stg_wfm_forecast (
  forecast_id                 INT64,
  queue_id                    INT64,
  interval_start_epoch        INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  forecast_volume             INT64,
  forecast_aht_sec            INT64,
  required_fte                NUMERIC(8, 2),
  load_date                   DATE
)
PARTITION BY load_date;
