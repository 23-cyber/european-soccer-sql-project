SELECT COUNT(*) AS non_optimal_bmi_count
FROM `ardent-fusion-447920-a4.Final_Exercise.PlayerBMI`
WHERE bmi < 18.5 OR bmi > 24.9;