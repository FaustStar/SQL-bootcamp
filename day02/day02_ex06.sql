WITH p AS (SELECT id
		FROM person
		WHERE name = 'Denis' OR name = 'Anna')
SELECT m.pizza_name,
	pz.name AS pizzeria_name
FROM p JOIN person_order AS po
	ON p.id = po.person_id
	JOIN menu AS m
	ON m.id = po.menu_id
	JOIN pizzeria AS pz
	ON pz.id = m.pizzeria_id
ORDER BY m.pizza_name, pizzeria_name;