INSERT INTO person_visits
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
	(SELECT id FROM person WHERE name = 'Dmitriy'),
	(SELECT pz.id
	FROM pizzeria AS pz JOIN menu AS m
	ON pz.id = m.pizzeria_id
	WHERE m.price < 800
		AND pz.name != (SELECT name
			FROM mv_dmitriy_visits_and_eats)
	LIMIT 1),
	'2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;