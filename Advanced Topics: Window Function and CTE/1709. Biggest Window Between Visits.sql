WITH lead_table AS (SELECT user_id, visit_date, 
LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date) AS next
FROM UserVisits), 

null_table AS (
    SELECT user_id, DATEDIFF('2021-01-01', visit_date) AS difference
    FROM lead_table WHERE next IS NULL 
), 

diff_table AS (
    SELECT user_id, DATEDIFF(next, visit_date) AS difference 
    FROM lead_table
    WHERE next IS NOT NULL 

    UNION ALL 

    SELECT * FROM null_table
)

SELECT user_id, MAX(difference) AS biggest_window
FROM diff_table
GROUP BY user_id
ORDER BY 1
