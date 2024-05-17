UPDATE `coaches` AS c
LEFT JOIN `players_coaches` AS pc ON c.`id` = pc.`coach_id`
SET `coach_level` = `coach_level` + 1
WHERE pc.`coach_id` IS NOT NULL AND c.`first_name` LIKE 'A%'