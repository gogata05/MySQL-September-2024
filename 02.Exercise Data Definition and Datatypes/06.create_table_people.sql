CREATE DATABASE `people`;

USE `people`;

CREATE TABLE `people` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `picture` BLOB,
    `height` DECIMAL(10, 2),
    `weight` DECIMAL(10,2),
    `gender` ENUM('m', 'f') NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
);

INSERT INTO `people` (`name`, `gender`, `birthdate`)
VALUES
('Mihail', 'm', DATE(NOW())),
('Vanq', 'f', DATE(NOW())),
('Nikola', 'm', DATE(NOW())),
('Krasimira', 'f', DATE(NOW())),
('Atanas', 'm', DATE(NOW()))