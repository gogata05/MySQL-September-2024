SELECT
	REVERSE(s.`name`) AS `reversed_name`,
    CONCAT(UPPER(t.`name`), '-', a.`name`) AS `full_address`,
    COUNT(e.`store_id`) AS `employees_count`
FROM `stores` AS s    
JOIN `addresses` AS a ON a.`id` = s.`address_id`
JOIN `towns` AS t  ON t.`id` = a.`town_id`
JOIN `employees` AS e ON s.`id` = e.`store_id` 
GROUP BY `reversed_name`, `full_address`
HAVING `employees_count` >= 1
ORDER BY `full_address`