-- ods_interaction: Conformed interaction from ods_call, ods_chat_session,
--   ods_email_interaction, staging.stg_file_interaction_export
-- Source: ods.ods_interaction | Partition: event_date STRING -> DATE
CREATE TABLE ods_interaction (
  interaction_id              STRING,
  channel                     STRING,
  client_code                 STRING,
  program_id                  INT64,
  queue_id                    INT64,
  agent_id                    INT64,
  customer_ref                STRING,
  start_ts                    TIMESTAMP,
  end_ts                      TIMESTAMP,
  handle_seconds              INT64,
  resolved_flag               BOOL,
  source_system               STRING,
  event_date                  DATE
)
PARTITION BY event_date;
