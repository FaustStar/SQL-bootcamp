WITH d AS (SELECT *
		FROM generate_series('2022-01-01'::timestamp, '2022-01-10', '1 days')),
	pv AS (SELECT person_id, visit_date
		FROM person_visits
		WHERE person_id = 1 OR person_id = 2)
SELECT (CAST(d.generate_series AS date)) AS missing_date
FROM pv RIGHT JOIN d
	ON pv.visit_date = d.generate_series
WHERE pv.person_id IS NULL
ORDER BY missing_date;