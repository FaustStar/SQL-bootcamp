SELECT p.address, pz.name, COUNT(*) AS count_of_orders
FROM person AS p JOIN person_order AS po
		ON p.id = po.person_id
	JOIN menu AS m
		ON m.id = po.menu_id
	JOIN pizzeria AS pz
		ON pz.id = m.pizzeria_id
GROUP BY p.address, pz.name
ORDER BY p.address, pz.name;