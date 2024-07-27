CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
	SELECT pz.name
	FROM menu AS m
		JOIN pizzeria AS pz
		ON pz.id = m.pizzeria_id
	WHERE pz.id IN (
			SELECT pv.pizzeria_id
			FROM person_visits AS pv
				JOIN person AS p
				ON p.id = pv.person_id
			WHERE p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08')
		AND m.price < 800;