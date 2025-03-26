CREATE TABLE `ardent-fusion-447920-a4.Final_Exercise.PlayerBMI` AS
SELECT 
  p.player_api_id,
  p.player_name,
  p.height / 100 AS m_height,
  p.weight / 2.205 AS kg_weight,
  (p.weight / 2.205) / POWER(p.height / 100, 2) AS bmi
FROM `ardent-fusion-447920-a4.Final_Exercise.player` AS p;