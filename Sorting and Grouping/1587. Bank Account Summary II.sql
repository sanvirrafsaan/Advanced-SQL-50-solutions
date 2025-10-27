# Write your MySQL query statement below
SELECT u.name, t.balance
FROM 
(SELECT account, SUM(amount) AS balance
FROM Transactions
GROUP BY account) t
LEFT JOIN Users u 
ON t.account = u.account
WHERE t.balance > 10000;
