SELECT `department_id`,
MIN(`salary`) AS `Min salary`
FROM `employees`
WHERE `department_id` = 1
GROUP BY `department_id`