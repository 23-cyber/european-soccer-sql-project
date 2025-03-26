SELECT 
  m.season,
  l.name AS league_name,
  SUM(m.home_team_goal + m.away_team_goal) AS total_goals
FROM `ardent-fusion-447920-a4.Final_Exercise.match` AS m
INNER JOIN `ardent-fusion-447920-a4.Final_Exercise.leagues` AS l
ON m.league_id = l.id
GROUP BY m.season, l.name
ORDER BY total_goals DESC
LIMIT 1;