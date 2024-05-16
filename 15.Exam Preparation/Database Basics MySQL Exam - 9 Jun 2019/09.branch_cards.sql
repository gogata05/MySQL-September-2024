SELECT
	b.`name`,
    COUNT(cd.`bank_account_id`) AS `counts_of_cards`
FROM `branches` AS b
LEFT JOIN `employees` AS e ON e.`branch_id` = b.`id`
LEFT JOIN `employees_clients` AS ec ON ec.`employee_id` = e.`id`
LEFT JOIN `clients` AS c ON c.`id` = ec.`client_id`
LEFT JOIN `bank_accounts` AS ba ON ba.`client_id` = c.`id`
LEFT JOIN `cards` AS cd ON cd.`bank_account_id` = ba.`id`
GROUP BY b.`name`
ORDER BY `counts_of_cards`DESC, b.`name`
     