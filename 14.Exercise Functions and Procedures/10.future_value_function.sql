DELIMITER %%

CREATE FUNCTION ufn_calculate_future_value(initial_sum DECIMAL(19, 4), interest_rate DOUBLE, number_of_years INT)
RETURNS DECIMAL(19, 4)
DETERMINISTIC
BEGIN

		DECLARE future_sum DECIMAL(19, 4);
        SET future_sum := initial_sum * POW(1 + interest_rate, number_of_years);
        RETURN future_sum;

END%%