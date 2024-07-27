SELECT p.name,
	m.pizza_name,
	m.price,
	ROUND(m.price * (1 - pd.discount / 100)) AS discount_price,
	pz.name AS pizzeria_name
FROM person AS p JOIN person_order AS po
	ON p.id = po.person_id
	JOIN menu AS m
	ON m.id = po.menu_id
	JOIN pizzeria AS pz
	ON pz.id = m.pizzeria_id
	JOIN person_discounts AS pd
	ON pz.id = pd.pizzeria_id AND p.id = pd.person_id
ORDER BY p.name, m.pizza_name;