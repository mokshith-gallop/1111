-- stg_tkt_ticket_event: Sqoop mirror of public.ticket_events (Postgres tixdb01)
-- Source: staging.stg_tkt_ticket_event | Partition: load_date STRING -> DATE
CREATE TABLE stg_tkt_ticket_event (
  ticket_event_id             INT64,
  ticket_id                   INT64,
  event_type                  STRING,
  event_ms                    INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  actor_agent_id              INT64,
  old_value                   STRING,
  new_value                   STRING,
  load_date                   DATE
)
PARTITION BY load_date;
