SELECT round(1.0 * count(distinct a.player_id) / (select count(distinct player_id) from Activity), 2) as fraction
FROM Activity a
CROSS JOIN Activity b
WHERE a.player_id = b.player_id
  AND a.event_date = DATEADD(day, 1, b.event_date)
  and b.event_date = (select min(event_date) from Activity group by player_id having player_id = b.player_id)