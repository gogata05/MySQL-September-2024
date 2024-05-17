SELECT
	c.`name`,
    COUNT(p.`id`) AS `total_count_of_players`,
    SUM(DISTINCT p.`salary`) AS `total_sum_of_salaries`
FROM `players` AS `p`
    JOIN `teams` AS `t` ON `p`.`team_id` = `t`.`id`
    JOIN `stadiums` AS `s` ON `t`.`stadium_id` = `s`.`id`
	RIGHT JOIN `towns` AS `ts` ON `s`.`town_id` = `ts`.`id`
	RIGHT JOIN `countries` AS `c` ON `ts`.`country_id` = `c`.`id`
GROUP BY c.`name`   
ORDER BY `total_count_of_players` DESC, c.`name`