
-- WITH staging_count AS (
--     SELECT 
--         (SELECT COUNT(*) AS AccountsTableCount
--             FROM {{ ref('stg_salesforce__account') }},
--         SELECT COUNT(*) AS CampaignsTableCount
--             FROM {{ ref('stg_salesforce__campaign') }},
--         SELECT COUNT(*) AS ContactTableCount
--             FROM {{ ref('stg_salesforce__contact') }},
--         SELECT COUNT(*) AS LeadssTableCount
--             FROM {{ ref('stg_salesforce__lead') }},
--         SELECT COUNT(*) AS OpportunityTableCount
--             FROM {{ ref('stg_salesforce__opportunity') }},
--         SELECT COUNT(*) AS PricebookTableCount
--             FROM {{ ref('stg_salesforce__pricebook_entry') }},
--         SELECT COUNT(*) AS UsersTableCount
--             FROM {{ ref('stg_salesforce__user_role') }}
-- )),

-- mart_count AS (
--     SELECT
--         (SELECT COUNT(*) AS AccountsTableCount
--             FROM {{ ref('DimAccounts') }}, 
--         SELECT COUNT(*) AS CampaignsTableCount
--             FROM {{ ref('DimCampaignsDetail') }},
--         SELECT COUNT(*) AS ContactTableCount
--             FROM {{ ref('DimContacts') }}, 
--         SELECT COUNT(*) AS LeadssTableCount
--             FROM {{ ref('DimLeadsDetail') }},
--         SELECT COUNT(*) AS OpportunityTableCount
--             FROM {{ ref('DimOpportunitiesDetail') }},
--         SELECT COUNT(*) AS PricebookTableCount
--             FROM {{ ref('DimPricebook') }},
--         SELECT COUNT(*) AS UsersTableCount
--             FROM {{ ref('DimUser') }}
-- ))

-- SELECT 
--     1
-- FROM 
--     staging_count s, 
--     mart_count m
-- WHERE 
--     s.AccountsTableCount <> m.AccountsTableCount
--     AND s.CampaignsTableCount <> m.CampaignsTableCount
--     AND s.ContactTableCount <> m.ContactTableCount
--     AND s.LeadssTableCount <> m.LeadssTableCount
--     AND s.OpportunityTableCount <> m.OpportunityTableCount
--     AND s.PricebookTableCount <> m.PricebookTableCount
--     AND s.UsersTableCount <> m.UsersTableCount


WITH staging_count AS (
    SELECT 
        (SELECT COUNT(*)
            FROM {{ ref('stg_salesforce__account') }}) AS AccountsTableCount,
        (SELECT COUNT(*)
            FROM {{ ref('stg_salesforce__campaign') }}) AS CampaignsTableCount,
        (SELECT COUNT(*)
            FROM {{ ref('stg_salesforce__contact') }}) AS ContactTableCount,
        (SELECT COUNT(*)
            FROM {{ ref('stg_salesforce__lead') }}) AS LeadsTableCount,
        (SELECT COUNT(*)
            FROM {{ ref('stg_salesforce__opportunity') }}) AS OpportunityTableCount,
        (SELECT COUNT(*)
            FROM {{ ref('stg_salesforce__pricebook_entry') }}) AS PricebookTableCount,
        (SELECT COUNT(*)
            FROM {{ ref('stg_salesforce__user') }}) AS UsersTableCount
),

mart_count AS (
    SELECT
        (SELECT COUNT(*)
            FROM {{ ref('DimAccounts') }}) AS AccountsTableCount, 
        (SELECT COUNT(*)
            FROM {{ ref('DimCampaignsDetail') }}) AS CampaignsTableCount,
        (SELECT COUNT(*)
            FROM {{ ref('DimContacts') }}) AS ContactTableCount,
        (SELECT COUNT(*)
            FROM {{ ref('DimLeadsDetail') }}) AS LeadsTableCount,
        (SELECT COUNT(*)
            FROM {{ ref('DimOpportunitiesDetail') }}) AS OpportunityTableCount,
        (SELECT COUNT(*)
            FROM {{ ref('DimPricebook') }}) AS PricebookTableCount, 
        (SELECT COUNT(*)
            FROM {{ ref('DimUser') }}) AS UsersTableCount
)

SELECT 
    1
FROM 
    staging_count s, 
    mart_count m
WHERE 
    s.AccountsTableCount <> m.AccountsTableCount
    AND s.CampaignsTableCount <> m.CampaignsTableCount
    AND s.ContactTableCount <> m.ContactTableCount
    AND s.LeadsTableCount <> m.LeadsTableCount
    AND s.OpportunityTableCount <> m.OpportunityTableCount
    AND s.PricebookTableCount <> m.PricebookTableCount
    AND s.UsersTableCount <> m.UsersTableCount