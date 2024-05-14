SELECT 
	e.`first_name`,
    e.`last_name`,
    t.`name` AS `town`,
    a.`address_text`
 FROM `employees` AS e
 JOIN `addresses` AS a
 JOIN `towns` AS t
	ON e.`address_id` = a.`address_id`
    WHERE a.`town_id` = t.`town_id`
ORDER BY `first_name`, `last_name`
LIMIT 5    