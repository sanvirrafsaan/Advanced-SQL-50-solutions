
SELECT project_id, employee_id 
FROM
(SELECT p.project_id, e.employee_id, e.experience_years, 
DENSE_RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS dense_rank_num FROM Project p 
LEFT JOIN Employee e 
ON p.employee_id = e.employee_id) t
WHERE dense_rank_num = 1
