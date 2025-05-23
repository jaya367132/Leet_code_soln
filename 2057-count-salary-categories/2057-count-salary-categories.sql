# Write your MySQL query statement below
WITH categorized AS (
    SELECT 
        account_id, 
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category
    FROM Accounts
),
all_categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)
SELECT 
    ac.category, 
    COUNT(c.account_id) AS accounts_count
FROM all_categories ac
LEFT JOIN categorized c ON ac.category = c.category
GROUP BY ac.category;

