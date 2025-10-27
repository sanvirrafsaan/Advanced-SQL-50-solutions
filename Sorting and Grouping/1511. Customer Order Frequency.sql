# Write your MySQL query statement below
SELECT customer_id, name
FROM
(SELECT c.customer_id, c.name
FROM Orders o 
LEFT JOIN Customers c ON c.customer_id = o.customer_id
LEFT JOIN Product p ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-06-01' AND '2020-07-31'
GROUP BY c.customer_id, MONTH(o.order_date)
HAVING SUM(o.quantity * p.price) >= 100) t1
GROUP BY customer_id 
HAVING COUNT(*) > 1
