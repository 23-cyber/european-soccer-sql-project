SELECT 
  m.season,
  l.name AS league_name,
  MIN(m.home_team_goal) AS min_home_goals,
  AVG(m.home_team_goal) AS avg_home_goals,
  (MAX(m.home_team_goal) + MIN(m.home_team_goal)) / 2 AS mid_range_home_goals,
  MAX(m.home_team_goal) AS max_home_goals,
  SUM(m.home_team_goal) AS total_home_goals
FROM `ardent-fusion-447920-a4.Final_Exercise.match` AS m
INNER JOIN `ardent-fusion-447920-a4.Final_Exercise.leagues` AS l
ON m.league_id = l.id
GROUP BY m.season, l.name
ORDER BY m.season, l.name;