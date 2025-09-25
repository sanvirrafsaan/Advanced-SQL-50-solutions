SELECT s.seller_name
FROM Seller s 
LEFT JOIN 
(SELECT seller_id, COUNT(*) AS sale_count
FROM Orders
WHERE EXTRACT(YEAR FROM sale_date) = '2020'
GROUP BY seller_id) c
ON s.seller_id = c.seller_id 
WHERE c.sale_count IS NULL
ORDER BY s.seller_name
