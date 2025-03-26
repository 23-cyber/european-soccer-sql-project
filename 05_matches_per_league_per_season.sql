SELECT 
  m.season,
  l.name AS league_name,
  COUNT(m.id) AS total_matches
FROM `ardent-fusion-447920-a4.Final_Exercise.match` AS m
INNER JOIN `ardent-fusion-447920-a4.Final_Exercise.leagues` AS l
ON m.league_id = l.id
GROUP BY m.season, l.name
ORDER BY m.season, total_matches DESC;