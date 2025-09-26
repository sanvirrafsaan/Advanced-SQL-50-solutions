--Note: I know I should have left joined first before the case statement haha
-- Write your MySQL query statement below
WITH points_table AS (SELECT match_id, host_team, guest_team, CASE 
WHEN host_goals > guest_goals THEN 3
WHEN host_goals < guest_goals THEN 0
WHEN host_goals = guest_goals THEN 1
END AS host_points, CASE
WHEN host_goals > guest_goals THEN 0
WHEN host_goals < guest_goals THEN 3
WHEN host_goals = guest_goals THEN 1
END AS guest_points
FROM Matches)


SELECT t.team_id, t.team_name, COALESCE(p1.host_total, 0) + COALESCE(p2.guest_total, 0) AS num_points
FROM Teams t
LEFT JOIN (
    SELECT match_id, host_team, SUM(host_points) AS host_total
    FROM points_table
    GROUP BY host_team
) p1
ON t.team_id = p1.host_team
LEFT JOIN (
    SELECT match_id, guest_team, SUM(guest_points) AS guest_total
    FROM points_table
    GROUP BY guest_team
) p2
ON t.team_id = p2.guest_team
ORDER BY num_points DESC, t.team_id ASC
