-- dim_date: Date dimension (generated/loaded via datagen)
-- Source: dm.dim_date | Unpartitioned, clustered by PK
CREATE TABLE dim_date (
  date_key                    INT64,
  full_date                   STRING,
  day_of_week                 INT64,
  day_name                    STRING,
  week_of_year                INT64,
  month_no                    INT64,
  month_name                  STRING,
  quarter_no                  INT64,
  year_no                     INT64,
  is_weekend                  BOOL,
  is_holiday_us               BOOL,
  fiscal_period               STRING
)
CLUSTER BY date_key;
