SELECT c.customer_id, c.customer_name
FROM Customers c 
LEFT JOIN (SELECT customer_id, GROUP_CONCAT(product_name) AS products
FROM Orders 
GROUP BY customer_id) p
ON c.customer_id = p.customer_id
WHERE p.products LIKE '%A%' AND p.products LIKE '%B%' AND p.products NOT LIKE '%C%'
