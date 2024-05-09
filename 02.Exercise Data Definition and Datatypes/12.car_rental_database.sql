CREATE DATABASE `Car Rental`;

USE `Car Rental`;

CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category` VARCHAR(255) NOT NULL,
    `daily_rate` INT,
    `weekly_rate` INT,
    `monthly_rate` INT,
    `weekend_rate` INT
);

INSERT INTO `categories` (`category`)
VALUES
('Test1'),
('Test2'),
('Test3');

CREATE TABLE `cars` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `plate_number` VARCHAR(255) NOT NULL,
    `make` VARCHAR(255),
    `model` VARCHAR(255),
    `car_year` INT,
    `category_id` INT,
    `doors` INT,
    `picture` BLOB,
    `car_condition` VARCHAR(255),
    `available` BOOLEAN
);

INSERT INTO `cars` (`plate_number`)
VALUES
('Test1'),
('Test2'),
('Test3');

CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255),
    `notes` TEXT
);

INSERT INTO `employees` (`first_name`, `last_name`)
VALUES
('Ivan', 'Ivanov'),
('Pesho', 'Peshev'),
('Gargamel', 'Gargamelov');

CREATE TABLE `customers` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `driver_license_number` VARCHAR(255) NOT  NULL,
    `full_name` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255),
    `city` VARCHAR(255),
    `zip_code` VARCHAR(255),
    `notes` TEXT
);

INSERT INTO `customers` (`driver_license_number`, `full_name`)
VALUES
('1', 'Ivan Ivanov'),
('5', 'Pesho Peshev'),
('9', 'Gargamel Gargamelov');

CREATE TABLE `rental_orders` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `employee_id` INT NOT NULL,
    `customer_id` INT NOT NULL,
    `car_id` INT,
    `car_condition` VARCHAR(255),
    `tank_level` VARCHAR(255),
    `kilometrage_start` INT,
    `kilometrage_end` INT,
    `total_kilometrage` INT,
    `start_date` DATE,
    `end_date` DATE,
    `total_days` INT,
    `rate_applied` DOUBLE,
    `tax_rate` DOUBLE,
    `order_status` VARCHAR(255),
    `notes` TEXT
);

INSERT INTO `rental_orders` (`employee_id`, `customer_id`)
VALUES
(1, 2),
(3, 4),
(5, 6);