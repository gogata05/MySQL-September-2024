SELECT
	mi.`id`,
    m.`title`,
    mi.`runtime`,
    mi.`budget`,
    mi.`release_date`
FROM `movies_additional_info` AS mi
JOIN `movies` AS m ON mi.`id` = m.`movie_info_id`
WHERE YEAR(mi.`release_date`) BETWEEN 1996 AND 1999
ORDER BY `runtime`, `id`
LIMIT 20