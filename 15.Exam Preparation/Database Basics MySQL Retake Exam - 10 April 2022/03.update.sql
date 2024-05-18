UPDATE `movies_additional_info` mi
SET mi.`runtime` = mi.`runtime` - 10
WHERE mi.`id` BETWEEN 15 AND 25