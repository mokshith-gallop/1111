-- stg_tel_disposition_code: Sqoop mirror of SWITCH.DISPOSITION_CODES (Oracle switchdb01)
-- Source: staging.stg_tel_disposition_code | Partition: load_date STRING -> DATE
CREATE TABLE stg_tel_disposition_code (
  disposition_code            STRING,
  disposition_desc            STRING,
  category                    STRING,
  billable_flag               BOOL,
  created_epoch               INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
