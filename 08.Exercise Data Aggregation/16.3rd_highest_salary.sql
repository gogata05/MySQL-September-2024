SELECT DISTINCT `department_id`,
(
	SELECT DISTINCT `salary` FROM `employees` e2
    WHERE e1.`department_id` = e2.`department_id`
    ORDER BY `salary` DESC
    LIMIT 1 OFFSET 2
) AS `third_highest_salary`
FROM `employees` e1
HAVING `third_highest_salary` IS NOT NULL
ORDER BY `department_id` 