-- stg_tkt_category: Sqoop mirror of public.categories (Postgres tixdb01)
-- Source: staging.stg_tkt_category | Partition: load_date STRING -> DATE
CREATE TABLE stg_tkt_category (
  category_id                 INT64,
  category_code               STRING,
  category_name               STRING,
  sla_hours                   INT64,
  created_ms                  INT64 OPTIONS(description = 'epoch MILLISECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
