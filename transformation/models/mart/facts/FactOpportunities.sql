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
	,(SELECT Id FROM mart.DimDate dd WHERE strftime('%Y-%m-%d', dd.Date)  = strftime('%Y-%m-%d', op.lastmodifieddate))  AS LastModifiedDateId
	,(SELECT Id FROM mart.DimDate dd WHERE strftime('%Y-%m-%d', dd.Date) = strftime('%Y-%m-%d', op.createddate))  AS CreatedDateId
	,op.contactid AS ContactId
	,op.amount AS amount 
	,op.probability AS Probability
	,op.iswon AS IsWon
FROM 
	Staging_Opportunities op