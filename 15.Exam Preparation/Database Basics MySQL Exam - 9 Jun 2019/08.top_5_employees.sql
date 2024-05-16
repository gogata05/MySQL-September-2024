SELECT
	CONCAT(e.`first_name`, ' ', `last_name`) AS `name`,
    e.`started_on`,
    COUNT(ec.`employee_id`) AS `counts_of_clients`
FROM `employees` AS e    
JOIN `employees_clients` AS ec ON ec.`employee_id` = e.`id`
JOIN `clients` AS c ON c.`id` = ec.`client_id`
GROUP BY `name`, e.`started_on`,  e.`id`
ORDER BY `counts_of_clients`DESC, e.`id`
LIMIT 5