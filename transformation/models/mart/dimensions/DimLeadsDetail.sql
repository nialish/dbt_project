{{ config(materialized='incremental', unique_key='Id') }}

WITH StagingLeads AS (
	SELECT * 
	FROM dbt.staging.stg_salesforce__lead ssl   
)

SELECT 
	   sl.lead_id AS Id
	  ,sl.salutation AS Salutation
	  ,sl.firstname AS FirstName
	  ,sl.lastname AS LastName
	  ,sl.title AS Title
	  ,sl.company AS Company
	  ,sl.state AS State
	  ,sl.country AS Country
	  ,sl.email AS Email
	  ,sl.leadsource AS LeadSource
	  ,{{ convert_date_to_id_from_dim_date('sl.createddate') }} AS CreatedDateId
	  ,sl.createdbyid AS CreatedById
FROM 
	StagingLeads sl