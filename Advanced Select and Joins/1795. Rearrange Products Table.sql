SELECT product_id, CASE WHEN store1 THEN 'store1' END AS 'store', store1 as 'price'
FROM Products 
WHERE store1 IS NOT NULL 

UNION ALL 

SELECT product_id, CASE WHEN store2 THEN 'store2' END AS 'store', store2 as 'price'
FROM Products 
WHERE store2 IS NOT NULL 

UNION ALL 

SELECT product_id, CASE WHEN store3 THEN 'store3' END AS 'store', store3 as 'price'
FROM Products 
WHERE store3 IS NOT NULL 
