WITH m AS (SELECT *
		FROM menu
		WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza')
SELECT m.pizza_name,
	pz.name AS pizzeria_name,
	m.price
FROM m JOIN pizzeria AS pz
	ON pz.id = m.pizzeria_id
ORDER BY m.pizza_name, pizzeria_name;