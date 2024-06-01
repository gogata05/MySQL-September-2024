SELECT
    CONCAT(`first_name`, ' ', `last_name`) AS `full_name`,
    SUBSTR(`email`, 2, 10) AS `username`,
    REVERSE(`phone`) AS `password`
FROM `students` 
 WHERE `id` NOT IN (SELECT `student_id` FROM `students_courses`)
 ORDER BY `password` DESC

	SECOND SOLUTION WITH LEFT JOIN

SELECT
    CONCAT(`first_name`, ' ', `last_name`) AS `full_name`,
    SUBSTR(`email`, 2, 10) AS `username`,
    REVERSE(`phone`) AS `password`
FROM `students` AS s
LEFT JOIN `students_courses` AS sc ON s.`id` = sc.`student_id` 
WHERE sc.`student_id` IS NULL   
ORDER BY `password` DESC
