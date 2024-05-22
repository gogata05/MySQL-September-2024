DELIMITER %%

CREATE FUNCTION udf_game_info_by_name (game_name VARCHAR(20))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN

	DECLARE game_information VARCHAR(255);
    SET game_information := (
		SELECT
			CONCAT_WS(' ','The', g.`name`, 'is developed by a', t.`name`, 'in an office with an address', a.`name`)
        FROM `games` AS g
        JOIN `teams` AS t ON t.`id` = g.`team_id`
        JOIN `offices` AS o ON t.`office_id` = o.`id`
        JOIN `addresses` As a ON o.`address_id` = a.`id`
        WHERE g.`name` = game_name
    );
    RETURN game_information;
END%%