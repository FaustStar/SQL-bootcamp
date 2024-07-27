SELECT pizza_name AS object_name
FROM menu
UNION ALL -- without ALL the repeated rows won't be shown
	SELECT name
	FROM person
ORDER BY object_name;