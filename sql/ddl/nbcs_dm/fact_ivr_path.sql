-- fact_ivr_path: IVR path fact from ods_ivr_session
-- Source: dm.fact_ivr_path
-- Partition: date_key INT -> ingestion-time _PARTITIONDATE
CREATE TABLE fact_ivr_path (
  session_ref                 STRING,
  client_code                 STRING,
  menu_path_full              STRING,
  hops                        INT64,
  contained_flag              BOOL,
  exit_key                    STRING,
  duration_seconds            INT64,
  date_key                    INT64
)
PARTITION BY _PARTITIONDATE;
