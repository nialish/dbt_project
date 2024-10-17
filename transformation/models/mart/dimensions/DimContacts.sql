{{ config(materialized='incremental', unique_key='ContactId') }}

WITH StagingContacts AS (
	SELECT * 
	FROM dbt.staging.stg_salesforce__contact ssc  
)

SELECT 
	  sc.contact_id AS ContactId
	 ,sc.salutation AS salutation 
	 ,sc.firstname AS FirstName
	 ,sc.lastname AS LastName
	 ,sc.phone AS PhoneNumber
	 ,sc.email AS Email 
	 ,sc.title AS Title 
	 ,sc.department AS Department
	 ,{{ convert_date_to_id_from_dim_date('sc.lastmodifieddate') }} AS LastModifiedDateId
	 ,sc.lastmodifiedbyid 
FROM 
	StagingContacts sc