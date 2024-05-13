CREATE TABLE `clients`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `client_name` VARCHAR(100)
);

CREATE TABLE `projects`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `client_id` INT,
    `project_lead_id` INT,
    CONSTRAINT fk_projects_client_id_clients_id
    FOREIGN KEY (`client_id`)
    REFERENCES `clients`(`id`)
);

CREATE TABLE `employees`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `fisrt_name` VARCHAR(30),
    `last_name` VARCHAR(30),
    `project_id` INT,
    CONSTRAINT fk_employyes_project_id_projects_id
    FOREIGN KEY (`project_id`)
    REFERENCES `projects`(`id`)
);

ALTER TABLE `projects`
	ADD CONSTRAINT fk_projects_project_lead_id_employees_id
    FOREIGN KEY (`project_lead_id`)
    REFERENCES `employees`(`id`);