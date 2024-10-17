{{ config(materialized='incremental', unique_key='OpportunityId') }}

WITH Staging_Opportunities AS (
	SELECT * 
	FROM dbt.staging.stg_salesforce__opportunity
)

SELECT 
	 op.opportunity_id AS OpportunityId
	,'Unknown' AS leadId
	,op.accountid AS AccountId
	,op.pricebook2id AS PriceBookId
	,op.campaignid AS CampaignId
	,op.createdbyid AS CreatedById
	,{{ convert_date_to_id_from_dim_date('op.lastmodifieddate') }} AS LastModifiedDateId
	,{{ convert_date_to_id_from_dim_date('op.createddate') }} AS CreatedDateId
	,op.contactid AS ContactId
	,op.amount AS amount 
	,op.probability AS Probability
	,op.iswon AS IsWon
FROM 
	Staging_Opportunities op