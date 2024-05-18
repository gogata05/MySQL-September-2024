SELECT
	m.`title`,
    CASE
		WHEN mi.`rating` <= 4 THEN 'poor'
        WHEN mi.`rating` > 4 AND mi.`rating` <= 7 THEN 'good'
        WHEN mi.`rating` > 7 THEN 'excellent'
     END AS `rating`,
     IF(mi.`has_subtitles` = 1, 'english', '-') AS `subtitles`,
    mi.`budget`
FROM `movies` AS m
JOIN `movies_additional_info` AS mi ON m.`movie_info_id` = mi.`id`
ORDER BY mi.`budget`DESC