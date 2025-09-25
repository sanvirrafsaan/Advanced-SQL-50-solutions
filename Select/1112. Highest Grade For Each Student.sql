WITH ranked_table AS (SELECT *, ROW_NUMBER() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS row_num
FROM Enrollments) 

SELECT student_id, course_id, grade
FROM ranked_table 
WHERE row_num = 1
ORDER BY 1,2 
