CREATE VIEW `Top_employee` AS
SELECT * FROM `employees`
ORDER BY `salary`DESC LIMIT 1;

SELECT * FROM `Top_employee`