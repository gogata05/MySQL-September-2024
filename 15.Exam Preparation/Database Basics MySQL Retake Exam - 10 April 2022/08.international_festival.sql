SELECT 
	c.`name`,
    COUNT(m.`country_id`) AS `movies_count`
FROM `countries` AS c
JOIN `movies` AS m
WHERE c.`id` = m.`country_id`
GROUP BY c.`name`
HAVING `movies_count` >= 7
ORDER BY c.`name` DESC    