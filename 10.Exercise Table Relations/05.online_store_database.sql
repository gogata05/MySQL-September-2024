CREATE DATABASE `online_store_db`;
USE `online_store_db`;

CREATE TABLE `cities`(
	`city_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `item_types`(
	`item_type_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `customers`(
	`customer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `birthday` DATE,
	`city_id` INT NOT NULL
);

ALTER TABLE `customers`
ADD CONSTRAINT fk_customer_cities
FOREIGN KEY (`city_id`)
REFERENCES `cities`(`city_id`);

CREATE TABLE `orders`(
	`order_id` INT PRIMARY KEY AUTO_INCREMENT,
    `customer_id` INT,
    CONSTRAINT fk_orders_customers
    FOREIGN KEY (`customer_id`)
    REFERENCES `customers`(`customer_id`)
);

CREATE TABLE `items`(
	`item_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `item_type_id` INT NOT NULL,
    CONSTRAINT fk_items_item_types
    FOREIGN KEY (`item_type_id`)
    REFERENCES `item_types`(`item_type_id`)
);

CREATE TABLE `order_items`(
	`order_id` INT NOT NULL,
    `item_id` INT NOT NULL,
    CONSTRAINT pk_order_id_item_id
    PRIMARY KEY (`order_id`, `item_id`),
    CONSTRAINT fk_order_id
    FOREIGN KEY (`order_id`)
    REFERENCES `orders`(`order_id`),
	CONSTRAINT fk_items_id
    FOREIGN KEY (`item_id`)
    REFERENCES `items`(`item_id`)
);