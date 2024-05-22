SELECT
	c.`id` AS `car_id`,
    c.`make`,
    c.`mileage`,
    COUNT(co.`car_id`) AS `count_of_course`,
    ROUND(AVG(co.`bill`), 2) AS `avg_bill`
FROM `cars` AS c
LEFT JOIN `courses` AS co ON c.`id` = co.`car_id`    
GROUP BY c.`id`, c.`make`, c.`mileage`
HAVING `count_of_course` <> 2
ORDER BY `count_of_course` DESC, `car_id`