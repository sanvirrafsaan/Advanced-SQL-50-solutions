SELECT u.name, COALESCE(r.travelled_distance, 0) AS travelled_distance
FROM Users u
LEFT JOIN (
    SELECT user_id, SUM(distance) AS travelled_distance
    FROM Rides 
    GROUP BY user_id
) r
ON u.id = r.user_id
ORDER BY r.travelled_distance DESC, u.name ASC
