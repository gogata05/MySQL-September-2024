SELECT `category_id`
FROM `products`
WHERE `category_id` = 2 AND `price` > 8
GROUP BY `category_id`