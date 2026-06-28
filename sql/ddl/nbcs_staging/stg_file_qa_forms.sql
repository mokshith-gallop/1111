-- stg_file_qa_forms: SFTP file feed — qa_forms (JSON)
-- Source: staging.stg_file_qa_forms
-- Multi-column Hive partition (client_code, feed_date):
--   feed_date STRING -> DATE (BQ partition column)
--   client_code STRING -> regular column + CLUSTER BY
-- Complex type: sections ARRAY<STRUCT<...>> (Hive INT -> INT64 inside struct)
CREATE TABLE stg_file_qa_forms (
  qa_form_id                  STRING,
  interaction_ref             STRING,
  evaluator_email             STRING,
  evaluated_ms                INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  form_version                STRING,
  sections                    ARRAY<STRUCT<section_code STRING, max_points INT64, scored_points INT64>>,
  auto_fail                   BOOL,
  overall_pct                 NUMERIC(5, 2),
  client_code                 STRING,
  feed_date                   DATE
)
PARTITION BY feed_date
CLUSTER BY client_code;
