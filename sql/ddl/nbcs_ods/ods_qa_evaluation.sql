-- ods_qa_evaluation: Cleansed from staging.stg_file_qa_forms
-- Source: ods.ods_qa_evaluation | Partition: event_date STRING -> DATE
CREATE TABLE ods_qa_evaluation (
  qa_form_id                  STRING,
  client_code                 STRING,
  interaction_ref             STRING,
  evaluator_email             STRING,
  evaluated_ts                TIMESTAMP,
  form_version                STRING,
  section_count               INT64,
  scored_points               INT64,
  max_points                  INT64,
  auto_fail                   BOOL,
  overall_pct                 NUMERIC(5, 2),
  event_date                  DATE
)
PARTITION BY event_date;
