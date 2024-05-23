DELIMITER %%

CREATE PROCEDURE udp_happy_hour(product_name VARCHAR(50))
BEGIN

	UPDATE `products`
    SET `price` = `price`* 0.8
    WHERE `type` = product_name AND `price` >= 10;

END%%