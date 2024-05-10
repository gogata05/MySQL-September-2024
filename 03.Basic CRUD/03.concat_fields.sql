SELECT 
    CONCAT(`first_name`, ' ', `last_name`) AS `FULL NAME`,
    `job_title` AS `JOB TITLE`,
    `salary` AS `SALARY`
FROM
    `employees`
WHERE
    `salary` > 1000