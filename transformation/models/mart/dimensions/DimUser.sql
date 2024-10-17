{{ config(materialized='incremental', unique_key='Id') }}

WITH StagingUsers AS (
	SELECT * 
	FROM dbt.staging.stg_salesforce__user ssu  
)

SELECT 
	  su.user_id AS Id
	 ,su.username AS UserName
	 ,su.firstname AS FirstName
	 ,su.lastname AS LastName
	 ,su.companyname AS CompanyName
	 ,su.email AS Email
	 ,su.createdbyid 
	 ,{{ convert_date_to_id_from_dim_date('su.createddate') }} AS CreatedDateId
FROM 
	StagingUsers su