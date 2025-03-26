WITH team_ranking AS (
  SELECT season, team_name
  FROM (
    SELECT
      season, team_name,
      RANK() OVER (PARTITION BY season ORDER BY total_goals DESC) AS team_rank
    FROM (
      SELECT m.season,  t.team_long_name AS team_name,
        SUM(CASE WHEN m.home_team_api_id = t.team_api_id THEN m.home_team_goal ELSE 0 END +
            CASE WHEN m.away_team_api_id = t.team_api_id THEN m.away_team_goal ELSE 0 END) AS total_goals
      FROM `ardent-fusion-447920-a4.Final_Exercise.match` AS m
      INNER JOIN `ardent-fusion-447920-a4.Final_Exercise.team` AS t
      ON m.home_team_api_id = t.team_api_id OR m.away_team_api_id = t.team_api_id
      GROUP BY m.season, t.team_long_name
    )
  )
  WHERE team_rank = 1
)
SELECT team_name, COUNT(*) AS times_ranked_first
FROM team_ranking
GROUP BY team_name
ORDER BY times_ranked_first DESC
LIMIT 1;