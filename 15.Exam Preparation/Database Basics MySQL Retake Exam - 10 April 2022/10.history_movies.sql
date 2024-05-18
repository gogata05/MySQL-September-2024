DELIMITER %%

CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
BEGIN

	DECLARE history_movies INT;
    SET history_movies := (
		SELECT 
			COUNT(g.`name`) AS 'history_movies'
        FROM `actors` AS a
        JOIN `movies_actors` AS ma ON a.`id` = ma.`actor_id`
        JOIN `genres_movies` AS gm ON gm.`movie_id` = ma.`movie_id`
        JOIN `genres` AS g ON g.`id` = gm.`genre_id`
        WHERE g.`name` = 'History' AND CONCAT(a.`first_name`, ' ', a.`last_name`) = full_name
        GROUP BY g.`name`
    );
	RETURN history_movies;
END%%