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
	 ,{{ convert_date_to_id_from_dim_date('so.closedate') }} AS ClosedDateId
	 ,so.type AS Type
FROM 
	StagingOpportunities so