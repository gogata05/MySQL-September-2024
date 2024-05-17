SELECT
	t.`name` AS `team_name`,
    t.`established`,
    t.`fan_base`,
    COUNT(p.`team_id`) AS `players_count`
FROM `teams` AS t
LEFT JOIN `players` AS p ON p.`team_id` = t.`id`
GROUP BY `team_name`, t.`established`, t.`fan_base`
ORDER BY `players_count` DESC, t.`fan_base` DESC         