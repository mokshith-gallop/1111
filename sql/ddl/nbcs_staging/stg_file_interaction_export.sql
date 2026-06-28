-- stg_file_interaction_export: SFTP file feed — interactions
-- Source: staging.stg_file_interaction_export
-- Multi-column Hive partition (client_code, feed_date):
--   feed_date STRING -> DATE (BQ partition column)
--   client_code STRING -> regular column + CLUSTER BY
CREATE TABLE stg_file_interaction_export (
  interaction_ref             STRING,
  channel                     STRING,
  client_interaction_id       STRING,
  agent_email                 STRING,
  start_ms                    INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  end_ms                      INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  outcome                     STRING,
  customer_ref                STRING,
  client_code                 STRING,
  feed_date                   DATE
)
PARTITION BY feed_date
CLUSTER BY client_code;
