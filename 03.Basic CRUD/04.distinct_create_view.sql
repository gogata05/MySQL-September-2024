-- SELECT DISTINCT `department_id`
-- FROM `employees`

CREATE VIEW `Full_name_and_Salary` AS
SELECT  concat(`first_name`, ' ', `last_name`) AS `Full name`, `salary`
FROM `employees`
ORDER BY `salary` DESC ;

SELECT * FROM `Full_name_and_Salary`