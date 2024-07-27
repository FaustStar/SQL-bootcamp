SELECT m.pizza_name,
	m.price,
	pz.name AS pizzeria_name,
	pv.visit_date
FROM person AS p
	JOIN person_visits AS pv
		ON p.id = pv.person_id
	JOIN pizzeria AS pz
		ON pz.id = pv.pizzeria_id
	JOIN menu AS m
		ON pz.id = m.pizzeria_id
WHERE (m.price >= 800 AND m.price <= 1000)
	AND p.name = 'Kate'
ORDER BY m.pizza_name, m.price, pizzeria_name;