-- stg_tkt_worklog_delta: CDC delta feed from public.worklogs (Postgres tixdb01)
-- Source: staging.stg_tkt_worklog_delta | Partition: extract_ts STRING -> TIMESTAMP
CREATE TABLE stg_tkt_worklog_delta (
  worklog_id                  INT64,
  ticket_id                   INT64,
  agent_id                    INT64,
  minutes_logged              INT64,
  log_ms                      INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  note                        STRING,
  op                          STRING,
  change_ms                   INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  extract_ts                  TIMESTAMP
)
PARTITION BY DATE(extract_ts);
