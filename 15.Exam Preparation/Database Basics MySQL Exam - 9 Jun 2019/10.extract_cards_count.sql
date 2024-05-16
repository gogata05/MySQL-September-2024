DELIMITER %%

CREATE FUNCTION udf_client_cards_count(client_name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN

	DECLARE cards INT;
    SET cards := (
		SELECT
            COUNT(cd.`bank_account_id`) AS `number_of_cards`
        FROM `clients` AS c
        JOIN `bank_accounts` AS ba ON ba.`client_id` = c.`id`
        JOIN `cards` AS cd on cd.`bank_account_id` = ba.`id`
        GROUP BY c.`full_name`
        HAVING c.`full_name` = client_name
        
    );
	RETURN cards;
END%% 