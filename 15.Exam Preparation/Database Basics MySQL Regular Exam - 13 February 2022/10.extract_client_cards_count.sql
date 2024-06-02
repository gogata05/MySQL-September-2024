DELIMITER %%

CREATE FUNCTION udf_customer_products_count(customer_name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN

	DECLARE total_products INT;
    SET total_products := (
		SELECT 
			COUNT(op.`order_id`)
        FROM `customers` AS c
        JOIN `orders` AS o ON c.`id` = o.`customer_id`
        JOIN `orders_products` AS op ON o.`id` = op.`order_id` 
        WHERE c.`first_name` = customer_name
    );
	RETURN total_products;
END%% 