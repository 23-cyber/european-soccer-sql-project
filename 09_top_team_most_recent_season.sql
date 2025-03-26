WITH most_recent_season AS (
  SELECT MAX(season) AS latest_season
  FROM `ardent-fusion-447920-a4.Final_Exercise.match`
)
SELECT 
  t.team_long_name AS team_name,
  SUM(CASE WHEN m.home_team_api_id = t.team_api_id THEN m.home_team_goal ELSE 0 END +
      CASE WHEN m.away_team_api_id = t.team_api_id THEN m.away_team_goal ELSE 0 END) AS total_goals
FROM `ardent-fusion-447920-a4.Final_Exercise.match` AS m
INNER JOIN `ardent-fusion-447920-a4.Final_Exercise.team` AS t
ON m.home_team_api_id = t.team_api_id OR m.away_team_api_id = t.team_api_id
WHERE m.season = (SELECT latest_season FROM most_recent_season)
GROUP BY t.team_long_name
ORDER BY total_goals DESC
LIMIT 1;