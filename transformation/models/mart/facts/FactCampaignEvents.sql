{{ config(materialized='incremental', unique_key='CampaignId') }}

WITH DimCampaignEventStatuses AS (
 	SELECT * 
    FROM {{ ref('DimCampaignEventStatuses') }}
)

SELECT 
	 ssc.campaign_id AS CampaignId
	,dces.EventName 
	,(SELECT Id FROM mart.DimDate dd WHERE strftime('%Y-%m-%d', dd.Date)  = strftime('%Y-%m-%d', ssc.lastmodifieddate)) AS LastModifiedDateId 
	,ssc.expectedrevenue AS ExpectedRevenue
	,ssc.actualcost AS ActualCost
	,ssc.createdbyid AS CreatedById
FROM 	
	dbt.staging.stg_salesforce__campaign ssc
LEFT JOIN DimCampaignEventStatuses dces ON dces.CampaignStatus = ssc.status 