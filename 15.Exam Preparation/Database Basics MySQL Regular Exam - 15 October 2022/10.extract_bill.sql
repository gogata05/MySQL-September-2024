DELIMITER %%

CREATE FUNCTION udf_client_bill(full_name VARCHAR(50))
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN

	DECLARE bill DECIMAL(19,2);
    SET bill := (
		SELECT
			SUM(`price`)
        FROM `products` AS p
        JOIN `orders_products` AS op ON p.`id` = op.`product_id`
        JOIN `orders` AS o ON o.`id` = op.`order_id` 
        JOIN `orders_clients` AS oc ON o.`id` = oc.`order_id`
        JOIN `clients` AS c ON c.`id` = oc.`client_id`
        WHERE CONCAT(c.`first_name`, ' ', `last_name`) = full_name
    );
	RETURN bill;

END%%