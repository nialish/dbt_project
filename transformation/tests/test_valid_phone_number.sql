
SELECT *
FROM {{ ref('DimAccounts') }} 
WHERE PhoneNumber IS NULL
   OR NOT regexp_matches(PhoneNumber, '^\(\d{3}\) \d{3}-\d{4}$') 