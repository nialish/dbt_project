{{ config(materialized='incremental', unique_key='Id') }}	
    
WITH StagingPricebook AS (
    SELECT * 
    FROM dbt.staging.stg_salesforce__pricebook_entry ssc 
)

SELECT 
        spb.pricebook_entry_id AS Id
        ,spb.product2id AS ProductId
        ,spb.unitprice AS UnitPrice 
        ,spb.isactive AS IsActive 
        ,{{ convert_date_to_id_from_dim_date('spb.createddate') }} AS CreatedDateId
        ,spb.createdbyid AS CreatedById
FROM 
    StagingPricebook spb