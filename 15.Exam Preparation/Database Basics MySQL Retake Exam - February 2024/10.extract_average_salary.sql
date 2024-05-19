DELIMITER %%

CREATE FUNCTION udf_average_salary_by_position_name (position_name VARCHAR(40)) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN

	DECLARE position_average_salary DECIMAL(10, 2);
    SET position_average_salary := (
			SELECT
				AVG(`salary`)
            FROM `workers` AS w
            JOIN `positions` AS p ON p.`id` = w.`position_id`
            WHERE p.`name` = position_name
    );
	RETURN position_average_salary;
END%%