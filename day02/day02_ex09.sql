WITH pid AS (SELECT po.person_id
		FROM menu AS m JOIN person_order AS po
			ON m.id = po.menu_id
		WHERE m.pizza_name = 'pepperoni pizza'
		INTERSECT
		SELECT po.person_id
		FROM menu AS m JOIN person_order AS po
			ON m.id = po.menu_id
		WHERE m.pizza_name = 'cheese pizza')
SELECT p.name
FROM person AS p JOIN pid
	ON p.id = pid.person_id
WHERE p.gender = 'female'
ORDER BY p.name;