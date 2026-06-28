-- stg_crm_client_contact: Sqoop mirror of CRM.CLIENT_CONTACTS (Oracle crmdb01)
-- Source: staging.stg_crm_client_contact | Partition: load_date STRING -> DATE
CREATE TABLE stg_crm_client_contact (
  contact_id                  INT64,
  client_id                   INT64,
  full_name                   STRING,
  email                       STRING,
  phone                       STRING,
  role                        STRING,
  is_primary                  BOOL,
  created_ts                  INT64 OPTIONS(description = 'epoch SECONDS (legacy)'),
  load_date                   DATE
)
PARTITION BY load_date;
