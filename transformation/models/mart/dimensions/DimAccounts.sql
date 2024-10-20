{{ config(materialized='incremental', unique_key='Id') }}

WITH StagingAccounts AS (
	SELECT * 
	FROM dbt.staging.stg_salesforce__account ssa   
)

SELECT 
	   sa.account_id AS Id
	  ,sa.name AS Name
	  ,sa.type AS TYPE
	  ,sa.phone AS PhoneNumber
	  ,sa.industry AS Industry
	  ,sa.annualrevenue AS AnnualRevenue
	  ,sa.numberofemployees AS NumberOfEmployees
	  ,{{ convert_date_to_id_from_dim_date('sa.createddate') }} AS CreatedDateId
	  ,sa.createdbyid AS CreatedById
FROM 
	StagingAccounts sa