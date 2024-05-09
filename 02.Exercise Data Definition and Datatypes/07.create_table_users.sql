CREATE TABLE `users`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` TIME,
    `is_deleted` BOOLEAN
);

INSERT INTO `users` (`username`, `password`)
VALUES
('Ivan', '12345'),
('Pesho', '54321'),
('Gosho', '67890'),
('Stancho', '09876'),
('Gancho', '112233')