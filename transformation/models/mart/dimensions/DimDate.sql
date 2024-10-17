{{ config(materialized='incremental', unique_key='Date') }}

WITH date_series AS (
    -- Create a series of dates from 2020-01-01 to 2030-12-31
    SELECT
        ('2020-01-01'::DATE + INTERVAL '1 day' * (row_number() OVER (ORDER BY 1)-1)) AS Date
    FROM range(365 * (2030 - 2020 + 1)) -- Range for the number of days between 2020 and 2030
)
SELECT
    row_number() OVER (ORDER BY Date) AS Id, -- Unique ID
    Date,                            -- Actual date
    strftime('%W', Date) AS Week,            -- Week number (week starts on Sunday)
    strftime('%m', Date) AS Month,           -- Month number
    strftime('%Y', Date) AS Year,            -- Year
    CASE 
        WHEN strftime('%m', date) IN ('01', '02', '03') THEN 1
        WHEN strftime('%m', date) IN ('04', '05', '06') THEN 2
        WHEN strftime('%m', date) IN ('07', '08', '09') THEN 3
        ELSE 4
    END AS Quarter                          -- Quarter based on the month
FROM date_series
ORDER BY date