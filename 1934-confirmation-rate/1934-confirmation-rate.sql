
-- select user_id, 1.0 * Count(case when action = 'confirmed'then 1 end) / Count(action) as  confirmation_rate
-- from Confirmations 
-- group by  user_id 

SELECT 
    s.user_id,
    CAST(
        COALESCE(
            1.0 * COUNT(CASE WHEN action = 'confirmed' THEN 1 END)
            / NULLIF(COUNT(action), 0),
            0
        ) AS DECIMAL(10,2)
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;