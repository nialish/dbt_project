{{ config(materialized='incremental', unique_key='Id') }}

WITH StagingOpportunities AS (
	SELECT * 
	FROM dbt.staging.stg_salesforce__opportunity sso 
)

SELECT 
	  so.opportunity_id AS Id
	 ,so.name AS Name
	 ,so.stagename AS StageName
	 ,so.stagesortorder AS StageOrder
	 ,(SELECT Id FROM mart.DimDate dd WHERE strftime('%Y-%m-%d', dd.Date)  = strftime('%Y-%m-%d', so.closedate))  AS ClosedDateId
	 ,so.type AS Type
FROM 
	StagingOpportunities so