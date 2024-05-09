-- CREATE DATABASE `Movies`;

-- USE `Movies`;

CREATE TABLE `directors`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);

INSERT INTO `directors` (`director_name`, `notes`)
VALUES
('Director1', 'Note1'),
('Director2', 'Note2'),
('Director3', 'Note3'),
('Director4', 'Note4'),
('Director5', 'Note5');

CREATE TABLE `genres` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);

INSERT INTO `genres` (`genre_name`, `notes`)
VALUES
('Genre1','Note1'),
('Genre2','Note2'),
('Genre3', 'Note3'),
('Genre4', 'Note4'),
('Genre5', 'Note5');

CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);

INSERT INTO `categories` (`category_name`, `notes`)
VALUES 
('Category1', 'Note1'),
('Category2', 'Note2'),
('Category3', 'Note3'),
('Category4', 'Note4'),
('Category5', 'Note5');

CREATE TABLE `movies`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `director_id` INT,
    `copyright_year` INT,
    `length` INT,
    `genre_id` INT,
    `category_id` INT,
    `rating` DOUBLE,
    `notes` TEXT
);

INSERT INTO `movies`(`title`)
VALUES
('Title1'),
('Title2'),
('Title3'),
('Title4'),
('Title5');