SELECT
	COUNT(c.`country_code`) AS `country_count`
FROM `countries` AS c
LEFT JOIN `mountains_countries` AS mc
		ON c.`country_code` = mc.`country_code`
LEFT JOIN `mountains` AS m
		ON m.`id` = mc.`mountain_id`
WHERE m.`id` IS NULL
       