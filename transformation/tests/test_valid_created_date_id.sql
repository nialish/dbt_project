SELECT CreatedDateId
FROM {{ ref('DimAccounts') }}
WHERE CreatedDateId NOT IN (SELECT Id FROM mart.DimDate)