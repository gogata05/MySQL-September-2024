CREATE DATABASE `university_db`;
USE `university_db`;

CREATE TABLE `subjects`(
	`subject_id` INT PRIMARY KEY AUTO_INCREMENT,
    `subject_name` VARCHAR(50)
);

CREATE TABLE `majors`(
	`major_id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50)
);

CREATE TABLE `students`(
	`student_id` INT PRIMARY KEY AUTO_INCREMENT,
    `student_number` VARCHAR(12),
	`student_name` VARCHAR(50),
    `major_id` INT
);

ALTER TABLE `students`
ADD CONSTRAINT fk_students_majors
FOREIGN KEY (`major_id`)
REFERENCES `majors`(`major_id`);

CREATE TABLE `payments`(
	`payment_id` INT PRIMARY KEY AUTO_INCREMENT,
    `payment_date` DATE,
    `payment_amount` DECIMAL(8, 2),
    `student_id` INT
);

ALTER TABLE `payments`
ADD CONSTRAINT fk_payments_students
FOREIGN KEY (`student_id`)
REFERENCES `students`(`student_id`);

CREATE TABLE `agenda`(
	`student_id` INT NOT NULL,
    `subject_id` INT NOT NULL
);

ALTER TABLE `agenda`
ADD CONSTRAINT pk_student_id_subject_id
PRIMARY KEY (`student_id`, `subject_id`),
ADD CONSTRAINT fk_agenda_students
FOREIGN KEY (`student_id`)
REFERENCES `students`(`student_id`),
ADD CONSTRAINT fk_agenda_subject
FOREIGN KEY (`subject_id`)
REFERENCES `subjects`(`subject_id`);