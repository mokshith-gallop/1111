-- ods_chat_session: Cleansed from staging.stg_file_chat_transcripts
-- Source: ods.ods_chat_session | Partition: event_date STRING -> DATE
CREATE TABLE ods_chat_session (
  chat_ref                    STRING,
  client_code                 STRING,
  queue_code                  STRING,
  agent_email                 STRING,
  started_ts                  TIMESTAMP,
  ended_ts                    TIMESTAMP,
  message_count               INT64,
  agent_message_count         INT64,
  customer_message_count      INT64,
  first_response_seconds      INT64,
  event_date                  DATE
)
PARTITION BY event_date;
