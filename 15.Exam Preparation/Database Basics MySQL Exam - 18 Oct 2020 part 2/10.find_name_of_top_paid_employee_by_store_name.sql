DELIMITER %%

CREATE FUNCTION udf_top_paid_employee_by_store(store_name VARCHAR(50)) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN

	DECLARE full_info VARCHAR(255);
    SET full_info := (
		SELECT
			CONCAT_WS(' ', e.`first_name`, CONCAT(e.`middle_name`, '.'), e.`last_name`, 'works in store for', TIMESTAMPDIFF(YEAR, e.`hire_date`, '2020-10-18'), 'years')
        FROM `employees` AS e
        JOIN `stores` AS s ON s.`id` = e.`store_id`
        WHERE s.`name` = store_name
        ORDER BY e.`salary` DESC
        LIMIT 1
    );
	RETURN full_info;
END%%