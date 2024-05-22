SELECT
	a.`name`,
    CASE
		WHEN HOUR(c.`start`) >= 6 AND HOUR(c.`start`) <= 20 THEN 'Day'
        WHEN HOUR(c.`start`) >= 21 OR HOUR(c.`start`) < 6 THEN 'Night'
    END AS `day_time`,
    c.`bill`,
    cs.`full_name`,
    ca.`make`,
    ca.`model`,
    cr.`name` AS `category_name`
FROM `addresses` AS a
JOIN `courses` AS c ON a.`id` = c.`from_address_id`
JOIN `clients` AS cs ON cs.`id` = c.`client_id`
JOIN `cars` AS ca ON ca.`id` = c.`car_id`
JOIN `categories` AS cr ON cr.`id` = ca.`category_id`     
ORDER BY c.`id`