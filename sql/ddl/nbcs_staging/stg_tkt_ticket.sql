-- stg_tkt_ticket: Sqoop mirror of public.tickets (Postgres tixdb01)
-- Source: staging.stg_tkt_ticket | Partition: load_date STRING -> DATE
CREATE TABLE stg_tkt_ticket (
  ticket_id                   INT64,
  ticket_no                   STRING,
  program_id                  INT64,
  category_id                 INT64,
  opened_by_agent_id          INT64,
  assigned_agent_id           INT64,
  interaction_ref             STRING,
  priority                    STRING,
  status                      STRING,
  created_ms                  INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  updated_ms                  INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
