SELECT pizza_name
FROM menu
UNION -- without ALL the repeated rows won't be shown
	SELECT pizza_name
	FROM menu
ORDER BY pizza_name DESC;