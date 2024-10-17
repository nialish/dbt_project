SELECT DISTINCT Industry
FROM {{ ref('YourModelName') }}  -- Replace with your actual model name
WHERE Industry NOT IN ('Electronics', 'Apparel', 'Construction','Consulting','Hospitality','Energy','Transportation','Education','Biotechnology')