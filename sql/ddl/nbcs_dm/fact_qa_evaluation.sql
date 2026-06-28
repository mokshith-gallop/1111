-- fact_qa_evaluation: QA evaluation fact from ods_qa_evaluation + fact_interaction
-- Source: dm.fact_qa_evaluation
-- Partition: date_key INT -> ingestion-time _PARTITIONDATE
CREATE TABLE fact_qa_evaluation (
  qa_form_id                  STRING,
  interaction_id              STRING,
  agent_sk                    INT64,
  program_sk                  INT64,
  evaluated_ts                TIMESTAMP,
  scored_points               INT64,
  max_points                  INT64,
  overall_pct                 NUMERIC(5, 2),
  auto_fail                   BOOL,
  date_key                    INT64
)
PARTITION BY _PARTITIONDATE;
