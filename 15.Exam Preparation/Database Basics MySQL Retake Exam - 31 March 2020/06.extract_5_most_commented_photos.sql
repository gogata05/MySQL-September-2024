SELECT
	p.`id`,
    p.`date` AS `date_and_time`,
    p.`description`,
    COUNT(c.`photo_id`) AS `commentsCount`
FROM `photos` AS p
JOIN `comments` AS c ON c.`photo_id` = p.`id`
GROUP BY p.`id`
ORDER BY `commentsCount` DESC, p.`id`
LIMIT 5