-- fact_ticket: Ticket fact from ods_ticket_acid + stg_tkt_ticket_event + stg_tkt_category
-- Source: dm.fact_ticket
-- Partition: date_key INT -> ingestion-time _PARTITIONDATE
CREATE TABLE fact_ticket (
  ticket_id                   INT64,
  program_sk                  INT64,
  category_code               STRING,
  assigned_agent_sk           INT64,
  priority                    STRING,
  status                      STRING,
  created_ts                  TIMESTAMP,
  resolved_ts                 TIMESTAMP,
  resolution_minutes          INT64,
  sla_breached_flag           BOOL,
  touch_count                 INT64,
  date_key                    INT64
)
PARTITION BY _PARTITIONDATE;
