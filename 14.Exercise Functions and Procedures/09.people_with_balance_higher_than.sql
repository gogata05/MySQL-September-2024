DELIMITER %%

CREATE PROCEDURE usp_get_holders_with_balance_higher_than(money DECIMAL(19, 4))
BEGIN

		SELECT ah.`first_name`, ah.`last_name` 
        FROM `account_holders` AS ah
		JOIN `accounts` AS a ON a.`account_holder_id` = ah.`id`
        GROUP BY ah.`first_name`, ah.`last_name`, a.`account_holder_id`
        HAVING SUM(a.`balance`) > money
        ORDER BY a.`account_holder_id`;

END%%