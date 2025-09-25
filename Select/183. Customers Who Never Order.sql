SELECT c.name AS Customers
FROM Customers c
LEFT JOIN 
(SELECT customerId, COUNT(*) AS order_count
FROM Orders 
GROUP BY customerId) AS o
ON c.id = o.customerId
WHERE o.order_count IS NULL
