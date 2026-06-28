-- stg_wfm_shift: Sqoop mirror of wfm.shifts (MySQL wfm01)
-- Source: staging.stg_wfm_shift | Partition: load_date STRING -> DATE
CREATE TABLE stg_wfm_shift (
  shift_id                    INT64,
  shift_code                  STRING,
  shift_name                  STRING,
  start_hhmm                  STRING,
  end_hhmm                    STRING,
  overnight_flag              BOOL,
  site_code                   STRING,
  created_epoch               INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
