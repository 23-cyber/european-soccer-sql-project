CREATE TABLE `ardent-fusion-447920-a4.Final_Exercise.TopScorer` AS
SELECT 
  t.team_api_id AS team_id,
  t.team_long_name AS team_name,
  SUM(CASE WHEN m.home_team_api_id = t.team_api_id THEN m.home_team_goal ELSE 0 END +
      CASE WHEN m.away_team_api_id = t.team_api_id THEN m.away_team_goal ELSE 0 END) AS total_goals
FROM `ardent-fusion-447920-a4.Final_Exercise.match` AS m
JOIN `ardent-fusion-447920-a4.Final_Exercise.team` AS t
ON m.home_team_api_id = t.team_api_id OR m.away_team_api_id = t.team_api_id
GROUP BY t.team_api_id, t.team_long_name
ORDER BY total_goals DESC
LIMIT 10;