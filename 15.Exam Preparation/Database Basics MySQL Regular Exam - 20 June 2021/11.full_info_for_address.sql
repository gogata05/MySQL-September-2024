DELIMITER %%

CREATE PROCEDURE udp_courses_by_address(address_name VARCHAR(100))
BEGIN

	SELECT 
		a.`name`,
        cl.`full_name` AS `full_names`,
        CASE
			WHEN c.`bill` <= 20 THEN 'Low'
            WHEN c.`bill` <= 30 THEN 'Medium'
            ELSE 'High'
         END AS `level_of_bill`,   
        ca.`make`,
        ca.`condition`,
        ct.`name`
    FROM `addresses` AS a
    JOIN `courses` AS c ON a.`id` = c.`from_address_id`
    JOIN `clients` AS cl ON c.`client_id` = cl.`id`
    JOIN `cars` AS ca ON ca.`id` =  c.`car_id`
    JOIN `categories` AS ct ON ct.`id` = ca.`category_id`
    WHERE a.`name` = address_name
    ORDER BY ca.`make`, `full_names`;

END%% 