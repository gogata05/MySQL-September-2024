DELIMITER %%

CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, amount_money DECIMAL(19, 4))
BEGIN

		START TRANSACTION;
			IF(amount_money < 0 OR (SELECT `balance` FROM `accounts` AS a WHERE a.`id` = from_account_id) < amount_money)
				OR from_account_id = to_account_id
                OR (SELECT COUNT(*) FROM `accounts` WHERE `id` = from_account_id) <> 1
                OR (SELECT COUNT(*) FROM `accounts` WHERE `id` = to_account_id) <> 1
                THEN ROLLBACK;
            ELSE 
				UPDATE `accounts` SET `balance` = `balance` - amount_money
                WHERE `id` = from_account_id;
                UPDATE `accounts` SET `balance` = `balance` + amount_money
                WHERE `id` = to_account_id; 
                COMMIT;
            END IF;

END%%