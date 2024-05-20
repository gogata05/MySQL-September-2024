DELIMITER %%

CREATE FUNCTION udf_users_photos_count(username VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN

	DECLARE photos_count INT;
    SET photos_count := (
		SELECT
			COUNT(up.`user_id`)
        FROM `users` AS u
        JOIN `users_photos` AS up ON u.`id` = up.`user_id`
        WHERE u.`username` = username
    );
	RETURN photos_count;
END%%