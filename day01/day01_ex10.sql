SELECT p.name AS person_name,
	m.pizza_name AS pizza_name,
	pz.name AS pizzeria_name
FROM person AS p
	JOIN person_order AS po
	ON p.id = po.person_id
	JOIN menu AS m
	ON m.id = po.menu_id
	JOIN pizzeria AS pz
	ON pz.id = m.pizzeria_id
ORDER BY person_name, pizza_name, pizzeria_name;