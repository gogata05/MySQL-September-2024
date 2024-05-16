DELIMITER %%

CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(19, 4))
BEGIN

		START TRANSACTION;
        IF(money_amount <= 0 OR (SELECT `balance` FROM `accounts` AS a WHERE a.`id` = account_id) < money_amount) THEN
			ROLLBACK;
        ELSE UPDATE `accounts` AS a1
			 SET a1.`balance` = a1.`balance` - money_amount
             WHERE a1.`id` = account_id;
        END IF;     

END%%