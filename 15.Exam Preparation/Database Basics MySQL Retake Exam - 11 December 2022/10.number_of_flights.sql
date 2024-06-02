DELIMITER %%

CREATE FUNCTION udf_count_flights_from_country(country VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN

	DECLARE flights_count INT;
    SET flights_count := (
		SELECT COUNT(*) 
		FROM `flights` AS f
		JOIN `countries` AS c ON c.`id` = f.`departure_country`
			WHERE c.`name` = country
        );
    
    RETURN flights_count;

END%%

								-- SECOND SOLUTION
                                
 DELIMITER %%

CREATE FUNCTION udf_count_flights_from_country(country VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN

	 DECLARE flights_count INT;
     SET flights_count := (
 		SELECT COUNT(*) 
 		FROM `flights` AS f
 			WHERE `departure_country` = (
 					SELECT `id`
					FROM `countries` AS c
						WHERE c.`name` = country
                     )
         );
     
     RETURN flights_count;

END%%                               