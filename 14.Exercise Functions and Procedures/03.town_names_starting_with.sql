DELIMITER %%

CREATE PROCEDURE usp_get_towns_starting_with(current_text VARCHAR(10))
BEGIN

		SELECT `name` FROM `towns`
        WHERE `name` LIKE CONCAT(current_text, '%')
        ORDER BY `name`;

END%%