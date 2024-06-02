DELETE FROM `flights`
WHERE `id` NOT IN (
	SELECT DISTINCT(`flight_id`)
	FROM `flights_passengers`
)