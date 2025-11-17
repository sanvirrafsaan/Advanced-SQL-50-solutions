# Write your MySQL query statement below

-- debug this if query don't work
WITH Team AS (SELECT team_id, COUNT(*) AS team_size
FROM Employee e 
GROUP BY team_id)

SELECT e.employee_id, t.team_size
FROM Employee e
LEFT JOIN Team t
ON e.team_id = t.team_id
