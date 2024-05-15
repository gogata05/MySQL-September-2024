SELECT 
	a1.`continent_code`, 
	a1.`currency_code`, 
	a1.`currency_usage` 
FROM (
    SELECT 
		`c`.`continent_code`, 
        `c`.`currency_code`,
		COUNT(`c`.`currency_code`) AS 'currency_usage' 
	FROM `countries` AS c
	GROUP BY c.`currency_code`, c.`continent_code` 
		HAVING `currency_usage` > 1
	 ) AS a1
LEFT JOIN  (
    SELECT 
    c1.`continent_code`,
    c1.`currency_code`,
    COUNT(c1.`currency_code`) AS `currency_usage` 
	FROM `countries` AS c1
	 GROUP BY c1.`currency_code`, c1.`continent_code` 
     HAVING `currency_usage` > 1
     ) AS b2
ON a1.`continent_code` = b2.`continent_code` AND b2.`currency_usage` > a1.`currency_usage`
WHERE b2.`currency_usage` IS NULL
ORDER BY a1.`continent_code`, a1.`currency_code`;

