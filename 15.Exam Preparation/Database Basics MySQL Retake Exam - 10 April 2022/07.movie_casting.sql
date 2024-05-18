SELECT
	CONCAT(`first_name`, ' ', `last_name`) AS `full_name`,
    CONCAT(REVERSE(`last_name`), CHAR_LENGTH(`last_name`), '@cast.com') AS `email`,
    ABS( YEAR(`birthdate`) - 2022) AS `age`,
    `height`
FROM `actors`     
WHERE `id` NOT IN(SELECT `actor_id` FROM `movies_actors` )
ORDER BY `height`