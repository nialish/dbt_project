{{ config(materialized='incremental', unique_key='CampaignId') }}

WITH StagingCampaigns AS (
	SELECT * 
	FROM dbt.staging.stg_salesforce__campaign ssc 
)

SELECT 
	  sc.campaign_id AS CampaignId
	 ,sc.name AS Name 
	 ,sc.type AS Type 
	 ,sc.isactive AS IsActive
	,(SELECT Id FROM mart.DimDate dd WHERE strftime('%Y-%m-%d', dd.Date)  = strftime('%Y-%m-%d', sc.startdate))  AS StateDateId
	,(SELECT Id FROM mart.DimDate dd WHERE strftime('%Y-%m-%d', dd.Date) = strftime('%Y-%m-%d', sc.EndDate))  AS EndDateId
FROM 
	StagingCampaigns sc