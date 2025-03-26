SELECT 
  a.team_name AS team_1,
  b.team_name AS team_2
FROM `ardent-fusion-447920-a4.Final_Exercise.TopScorer` AS a
JOIN `ardent-fusion-447920-a4.Final_Exercise.TopScorer` AS b
ON a.team_id < b.team_id;