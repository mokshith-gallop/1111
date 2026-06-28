-- ods_email_interaction: Cleansed from staging.stg_file_email_interaction
-- Source: ods.ods_email_interaction | Partition: event_date STRING -> DATE
CREATE TABLE ods_email_interaction (
  email_ref                   STRING,
  client_code                 STRING,
  mailbox                     STRING,
  agent_email                 STRING,
  received_ts                 TIMESTAMP,
  first_reply_ts              TIMESTAMP,
  resolved_ts                 TIMESTAMP,
  reply_sla_minutes           INT64,
  subject_category            STRING,
  event_date                  DATE
)
PARTITION BY event_date;
