{{ config(materialized='incremental', unique_key='LeadId') }}

WITH DimLeadEventStatuses AS (
 	SELECT * 
    FROM {{ ref('DimLeadEventsStatuses') }}
)

SELECT 
	lead_id AS LeadId
	,esd.EventName 
	,(SELECT Id FROM mart.DimDate dd WHERE strftime('%Y-%m-%d', dd.Date)  = strftime('%Y-%m-%d', ssl.lastmodifieddate)) AS LastModifiedDateId 
	,ssl.annualrevenue 
	,ssl.createdbyid 
FROM 	
	dbt.staging.stg_salesforce__lead ssl 
LEFT JOIN DimLeadEventStatuses esd ON esd.LeadStatus = ssl.status 
	