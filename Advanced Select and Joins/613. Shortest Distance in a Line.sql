# Write your MySQL query statement below
SELECT MIN(dist) AS shortest
FROM 
(SELECT p1.x AS x1, p2.x AS x2, abs(p1.x - p2.x) AS dist
    #SELECT p1.x, p2.x, abs(p1.x - p2.x) AS dist
FROM Point p1 
CROSS JOIN POINT p2
WHERE p1.x != p2.x) p
