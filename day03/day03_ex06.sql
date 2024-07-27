SELECT m1.pizza_name,
	pz1.name AS pizzeria_name_1,
	pz2.name AS pizzeria_name_2,
	m1.price
FROM pizzeria AS pz1 JOIN menu AS m1
	ON pz1.id = m1.pizzeria_id
	JOIN menu AS m2
	ON m1.price = m2.price AND m1.pizza_name = m2.pizza_name
	JOIN pizzeria AS pz2
	ON pz2.id = m2.pizzeria_id
WHERE pz1.name != pz2.name
	AND pz1.id > pz2.id
ORDER BY m1.pizza_name;