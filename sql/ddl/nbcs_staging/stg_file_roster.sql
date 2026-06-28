-- stg_file_roster: SFTP file feed — roster
-- Source: staging.stg_file_roster
-- Multi-column Hive partition (client_code, feed_date):
--   feed_date STRING -> DATE (BQ partition column)
--   client_code STRING -> regular column + CLUSTER BY
CREATE TABLE stg_file_roster (
  employee_no                 STRING,
  agent_email                 STRING,
  client_login                STRING,
  role_on_program             STRING,
  active_flag                 BOOL,
  as_of_ms                    INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  client_code                 STRING,
  feed_date                   DATE
)
PARTITION BY feed_date
CLUSTER BY client_code;
