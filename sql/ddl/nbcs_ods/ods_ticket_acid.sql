-- ods_ticket_acid: ACID transactional table from staging.stg_tkt_ticket + stg_tkt_ticket_event
-- Source: ods.ods_ticket_acid | Unpartitioned (small master table)
-- Hive CLUSTERED BY (ticket_id) INTO 8 BUCKETS + transactional='true' NOT carried
CREATE TABLE ods_ticket_acid (
  ticket_id                   INT64,
  ticket_no                   STRING,
  program_id                  INT64,
  category_id                 INT64,
  assigned_agent_id           INT64,
  priority                    STRING,
  status                      STRING,
  created_ts                  TIMESTAMP,
  updated_ts                  TIMESTAMP,
  resolved_ts                 TIMESTAMP
);
