DELIMITER %%

CREATE PROCEDURE udp_update_budget(game_rating FLOAT)
BEGIN

	UPDATE `games` AS g
	LEFT JOIN `games_categories` AS gc ON g.`id` = gc.`game_id`
    LEFT JOIN `categories` AS c ON gc.`category_id` = c.`id`
    SET g.`budget` = g.`budget` + 100000, g.`release_date` =  DATE_ADD(g.`release_date`, INTERVAL 1 YEAR)
    WHERE 
		c.`id` IS NULL AND
        g.`rating` > game_rating AND
        g.`release_date` IS NOT NULL;

END%%