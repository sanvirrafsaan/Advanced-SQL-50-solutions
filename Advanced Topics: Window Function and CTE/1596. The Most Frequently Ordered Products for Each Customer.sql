-- find the frequency of customer-product-order_count 
SELECT customer_id, product_id, product_name
FROM 
(SELECT o.customer_id, o.product_id, p.product_name, 
DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(o.product_id) DESC) AS rnk 
FROM Orders o
LEFT JOIN Products p
ON p.product_id = o.product_id
GROUP BY o.customer_id, o.product_id) temp 
WHERE rnk =1
