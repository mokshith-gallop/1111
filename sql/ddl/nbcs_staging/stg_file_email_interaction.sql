-- stg_file_email_interaction: SFTP file feed — email_interactions
-- Source: staging.stg_file_email_interaction
-- Multi-column Hive partition (client_code, feed_date):
--   feed_date STRING -> DATE (BQ partition column)
--   client_code STRING -> regular column + CLUSTER BY
CREATE TABLE stg_file_email_interaction (
  email_ref                   STRING,
  mailbox                     STRING,
  agent_email                 STRING,
  received_ms                 INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  first_reply_ms              INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  resolved_ms                 INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  subject_category            STRING,
  client_code                 STRING,
  feed_date                   DATE
)
PARTITION BY feed_date
CLUSTER BY client_code;
