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
	 ,{{ convert_date_to_id_from_dim_date('sc.startdate') }} AS StateDateId
	 ,{{ convert_date_to_id_from_dim_date('sc.EndDate') }} AS EndDateId
FROM 
	StagingCampaigns sc