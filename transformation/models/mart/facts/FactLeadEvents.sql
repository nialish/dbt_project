{{ config(materialized='incremental', unique_key='LeadId') }}

WITH DimLeadEventStatuses AS (
 	SELECT * 
    FROM {{ ref('DimLeadEventsStatuses') }}
)

SELECT 
	lead_id AS LeadId
	,esd.EventName 
	,{{ convert_date_to_id_from_dim_date('ssl.lastmodifieddate') }} AS LastModifiedDateId
	,ssl.annualrevenue 
	,ssl.createdbyid 
FROM 	
	dbt.staging.stg_salesforce__lead ssl 
LEFT JOIN DimLeadEventStatuses esd ON esd.LeadStatus = ssl.status 
	