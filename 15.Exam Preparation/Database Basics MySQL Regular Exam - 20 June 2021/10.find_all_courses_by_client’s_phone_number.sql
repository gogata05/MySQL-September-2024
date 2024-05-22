DELIMITER %%

CREATE FUNCTION udf_courses_by_client (phone_num VARCHAR (20)) 
RETURNS INT
DETERMINISTIC
BEGIN

	DECLARE cours_count INT;
    SET cours_count := (
		SELECT
			COUNT(`client_id`)
        FROM `courses` AS c
        JOIN `clients` AS cl ON cl.`id` = c.`client_id`
        WHERE cl.`phone_number` = phone_num
    );
	RETURN cours_count;
END%%