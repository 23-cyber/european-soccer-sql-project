WITH team_goals AS (
  SELECT 
    m.season, t.team_long_name AS team_name,
    SUM(CASE WHEN m.home_team_api_id = t.team_api_id THEN m.home_team_goal ELSE 0 END +
        CASE WHEN m.away_team_api_id = t.team_api_id THEN m.away_team_goal ELSE 0 END) AS total_goals
  FROM `ardent-fusion-447920-a4.Final_Exercise.match` AS m
  INNER JOIN `ardent-fusion-447920-a4.Final_Exercise.team` AS t
  ON m.home_team_api_id = t.team_api_id OR m.away_team_api_id = t.team_api_id
  GROUP BY m.season, t.team_long_name
),
ranked_teams AS (
  SELECT 
    season,
    team_name,
    total_goals,
    RANK() OVER (PARTITION BY season ORDER BY total_goals DESC) AS team_rank
  FROM team_goals
)
SELECT season, team_name, total_goals
FROM ranked_teams
WHERE team_rank = 1
ORDER BY season;