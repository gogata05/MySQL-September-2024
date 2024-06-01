SELECT
	uni.`name` AS `university_name`,
	c.`name` AS `city_name`,
    uni.`address`,
    CASE
		WHEN uni.`tuition_fee` < 800 THEN 'cheap'
        WHEN uni.`tuition_fee` >= 800 AND uni.`tuition_fee` < 1200 THEN 'normal'
        WHEN uni.`tuition_fee` >= 1200 AND uni.`tuition_fee` < 2500 THEN 'high'
        ELSE 'expensive'
     END AS `prica_rank`,
     uni.`tuition_fee`
FROM `universities` AS uni   
JOIN `cities` AS c ON uni.`city_id` = c.`id`
ORDER BY uni.`tuition_fee`