DELETE FROM `customers`
WHERE `id` NOT IN(SELECT `customer_id` FROM `orders`)

-- SECOND SOLUTION WITH LEFT JOIN

-- DELETE`c`
-- FROM `customers` AS`c`
-- LEFT JOIN `orders` AS `o` ON`c`.`id` = `o`.`customer_id`
-- WHERE`o`.`id` IS NULL; 