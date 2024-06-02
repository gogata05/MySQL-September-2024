DELIMITER %%

CREATE PROCEDURE udp_delay_flight(fligth_code VARCHAR(50))
BEGIN

	UPDATE `flights`
		SET `has_delay` = 1,
        `departure` = DATE_ADD(`departure`, INTERVAL 30 MINUTE)
    WHERE `flight_code` = fligth_code;

END%%