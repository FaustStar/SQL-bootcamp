(SELECT pz.name AS pizzeria_name
FROM pizzeria AS pz JOIN person_visits AS pv
	ON pz.id = pv.pizzeria_id
	JOIN person AS p
	ON p.id = pv.person_id
WHERE p.name = 'Andrey')
EXCEPT -- pizzerias that were visited by Andrey, but those where he didn't order anything
	(SELECT pz.name AS pizzeria_name
	FROM pizzeria AS pz JOIN menu AS m
		ON pz.id = m.pizzeria_id
		JOIN person_order AS po
		ON m.id = po.menu_id
		JOIN person AS p
		ON p.id = po.person_id
	WHERE p.name = 'Andrey')
ORDER BY pizzeria_name;