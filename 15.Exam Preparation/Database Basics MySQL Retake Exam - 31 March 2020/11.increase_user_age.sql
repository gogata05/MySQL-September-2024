DELIMITER %%

CREATE PROCEDURE udp_modify_user (address VARCHAR(30), town VARCHAR(30)) 
BEGIN

	UPDATE `users` AS u
    JOIN `addresses` AS a ON a.`user_id` = u.`id` 
    SET u.`age` = u.`age` + 10
    WHERE a.`address` = address AND a.`town` = town;

END%%