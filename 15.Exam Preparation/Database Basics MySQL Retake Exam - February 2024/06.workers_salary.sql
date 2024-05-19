SELECT
	w.`id`,
    w.`first_name`,
    w.`last_name`,
    p.`name` AS `preserve_name`,
    c.`country_code`
FROM `workers` AS w
JOIN `preserves` AS p ON p.`id` = w.`preserve_id`
JOIN `countries_preserves` AS cp ON cp.`preserve_id` = p.`id`
JOIN `countries` AS c ON c.`id` = cp.`country_id`
WHERE w.`salary` > 5000 AND `age` < 50
ORDER BY c.`country_code`