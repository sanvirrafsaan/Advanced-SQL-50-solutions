SELECT w.name AS warehouse_name, SUM(v.volume * w.units) AS volume
FROM Warehouse w 
LEFT JOIN
(SELECT product_id, Width * Length * Height AS volume
FROM Products) v
ON w.product_id = v.product_id
GROUP BY w.name
