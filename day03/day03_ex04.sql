WITH f AS (SELECT pz.name AS pizzeria_name
		FROM pizzeria AS pz JOIN menu AS m
			ON pz.id = m.pizzeria_id
			JOIN person_order AS po
			ON m.id = po.menu_id
			JOIN person AS p
			ON p.id = po.person_id
		WHERE p.gender = 'female'),
	m AS (SELECT pz.name AS pizzeria_name
		FROM pizzeria AS pz JOIN menu AS m
			ON pz.id = m.pizzeria_id
			JOIN person_order AS po
			ON m.id = po.menu_id
			JOIN person AS p
			ON p.id = po.person_id
		WHERE p.gender = 'male')
(SELECT pizzeria_name
FROM f
EXCEPT -- pizzerias that were visited only by women
	SELECT pizzeria_name
	FROM m)
UNION
	(SELECT pizzeria_name
	FROM m
	EXCEPT -- pizzerias that were visited only by men
		SELECT pizzeria_name
		FROM f)
ORDER BY pizzeria_name;