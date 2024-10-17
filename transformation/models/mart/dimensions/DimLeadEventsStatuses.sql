    SELECT
    'LeadCreated' AS EventName, 'Open - Not Contacted' AS LeadStatus
    UNION ALL
    SELECT
    'LeadCreated' AS EventName, 'Working - Contacted' AS LeadStatus
    UNION ALL
    SELECT
    'InProgress' AS EventName, 'Working - Contacted' AS LeadStatus
    UNION ALL
    SELECT
    'LeadCreated' AS EventName, 'Closed - Converted' AS LeadStatus
    UNION ALL
    SELECT
    'InProgress' AS EventName, 'Closed - Converted' AS LeadStatus
    UNION ALL
    SELECT
    'LeadWon' AS EventName, 'Closed - Converted' AS LeadStatus
    UNION ALL
    SELECT
    'LeadCreated' AS EventName, 'Closed - Not Converted' AS LeadStatus
    UNION ALL
    SELECT
    'InProgress' AS EventName, 'Closed - Not Converted' AS LeadStatus
    UNION ALL
    SELECT
    'LeadLost' AS EventName, 'Closed - Not Converted' AS LeadStatus