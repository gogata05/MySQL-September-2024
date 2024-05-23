SELECT
	t.`id`,
    t.`capacity`,
    COUNT(oc.`order_id`) AS `count_clients`,
    CASE
		WHEN t.`capacity` > COUNT(oc.`order_id`) THEN 'Free seats'
        WHEN t.`capacity` = COUNT(oc.`order_id`) THEN 'Full'
        WHEN t.`capacity` < COUNT(oc.`order_id`) THEN 'Extra seats'
END AS `availability`    
FROM `tables` AS t    
JOIN `orders` AS o ON t.`id` = o.`table_id`
JOIN `orders_clients` AS oc ON o.`id` = oc.`order_id`
WHERE t.`floor` = 1
GROUP BY t.`id`, t.`capacity` 
ORDER BY t.`id`  DESC