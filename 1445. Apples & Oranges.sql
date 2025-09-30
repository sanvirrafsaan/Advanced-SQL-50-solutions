-- Solution 1 
SELECT DISTINCT s.sale_date, (a.sold_num - o.sold_num) AS diff
FROM Sales s
LEFT JOIN 
(SELECT sale_date, sold_num
FROM Sales s
WHERE fruit = 'apples') a 
ON s.sale_date = a.sale_date
LEFT JOIN 
(SELECT sale_date, sold_num
FROM Sales
WHERE fruit = 'oranges') o
ON s.sale_date = o.sale_date
ORDER BY s.sale_date

-- Solution 2 
SELECT a.sale_date, a.sold_num - b.sold_num AS diff
FROM Sales a
INNER JOIN Sales b
  ON a.sale_date = b.sale_date
WHERE a.fruit = 'apples'
  AND b.fruit = 'oranges'
ORDER BY a.sale_date;
