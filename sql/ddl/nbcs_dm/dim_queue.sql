-- dim_queue: Queue dimension from ods_queue
-- Source: dm.dim_queue | Unpartitioned, clustered by PK
CREATE TABLE dim_queue (
  queue_sk                    INT64,
  queue_id                    INT64,
  queue_code                  STRING,
  queue_name                  STRING,
  program_id                  INT64,
  media_type                  STRING,
  priority                    INT64
)
CLUSTER BY queue_sk;
