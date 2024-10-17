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
	 ,(SELECT Id FROM mart.DimDate dd WHERE strftime('%Y-%m-%d', dd.Date)  = strftime('%Y-%m-%d', su.createddate))  AS CreatedDateId
FROM 
	StagingUsers su