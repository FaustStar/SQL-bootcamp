INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
	(SELECT MAX(id) FROM person_order) + gen,
	p.id,
	(SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
	'2022-02-25'
FROM person AS p
	JOIN generate_series(1, (SELECT COUNT(id) FROM person), 1) AS gen
	ON p.id = gen;