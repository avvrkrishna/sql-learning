/*#########################################################
#   Snowflake Pipe created for Continuous Data Ingestion  #
##########################################################*/

--Pipe for Customer Data Ingestion
CREATE PIPE DBS_ANALYTICS.STAGE.CUSTOMER_INGEST_PIPE 
AUTO_INGEST=TRUE AS
  COPY INTO DBS_ANALYTICS.STAGE.RAW_CUSTOMER_DIM
  FROM @STAGE.AWS_ETL_ANALYTICS_STG/USER/
  FILE_FORMAT = (FORMAT_NAME='MY_CSV');

--Pipe for Transaction Data Ingestion
CREATE OR REPLACE PIPE DBS_ANALYTICS.STAGE.TRANSACTION_INGEST_PIPE 
AUTO_INGEST=TRUE AS
  COPY INTO DBS_ANALYTICS.STAGE.RAW_SALES_TRANSACTION_FACT
  FROM @STAGE.AWS_ETL_ANALYTICS_STG/TRANSACTIONS/
  FILE_FORMAT = (FORMAT_NAME='MY_CSV');
