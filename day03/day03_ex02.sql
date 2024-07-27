WITH m_id AS (SELECT id AS menu_id
		FROM menu
		EXCEPT
		SELECT menu_id
		FROM person_order)
SELECT m.pizza_name, m.price, pz.name AS pizzeria_name
FROM m_id JOIN menu AS m
	ON m.id = m_id.menu_id
	JOIN pizzeria AS pz
	ON pz.id = m.pizzeria_id
ORDER BY m.pizza_name, m.price;