WITH f AS (SELECT pz.name AS pizzeria_name
		FROM pizzeria AS pz JOIN person_visits AS pv
			ON pz.id = pv.pizzeria_id
			JOIN person AS p
			ON p.id = pv.person_id
		WHERE p.gender = 'female'),
	m AS (SELECT pz.name AS pizzeria_name
		FROM pizzeria AS pz JOIN person_visits AS pv
			ON pz.id = pv.pizzeria_id
			JOIN person AS p
			ON p.id = pv.person_id
		WHERE p.gender = 'male')
(SELECT pizzeria_name
FROM f
EXCEPT ALL -- pizzerias that were visited more often by women
	SELECT pizzeria_name
	FROM m)
UNION ALL
	(SELECT pizzeria_name
	FROM m
	EXCEPT ALL -- pizzerias that were visited more often by men
		SELECT pizzeria_name
		FROM f)
ORDER BY pizzeria_name;