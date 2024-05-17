SELECT
    MAX(sd.`speed`) AS `max_speed`,
    tw.`name` AS `town_name`
FROM `skills_data` AS sd
JOIN `players` AS p ON p.`skills_data_id` = sd.`id`
RIGHT JOIN `teams` AS t ON t.`id` = p.`team_id`
JOIN `stadiums` AS s ON s.`id` = t.`stadium_id`
JOIN `towns` AS tw ON tw.`id` = s.`town_id`    
WHERE t.`name` != 'Devify'
GROUP BY tw.`name`
ORDER BY`max_speed` DESC, `town_name`;