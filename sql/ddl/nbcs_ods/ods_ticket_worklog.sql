-- ods_ticket_worklog: Delta-merged from staging.stg_tkt_worklog_delta
-- Source: ods.ods_ticket_worklog | Partition: event_date STRING -> DATE
CREATE TABLE ods_ticket_worklog (
  worklog_id                  INT64,
  ticket_id                   INT64,
  agent_id                    INT64,
  minutes_logged              INT64,
  log_ts                      TIMESTAMP,
  note                        STRING,
  last_change_ts              TIMESTAMP,
  event_date                  DATE
)
PARTITION BY event_date;
