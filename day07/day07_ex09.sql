WITH float_value AS (SELECT id, CAST(age AS numeric)
		FROM person)
SELECT p.address,
	ROUND(MAX(fv.age) - MIN(fv.age) / MAX(fv.age), 2) AS formula,
	ROUND(AVG(fv.age), 2) AS average,
	CASE
		WHEN ROUND(MAX(fv.age) - MIN(fv.age) / MAX(fv.age), 2) > ROUND(AVG(fv.age), 2) THEN TRUE
		ELSE FALSE
	END AS comparison
FROM person AS p JOIN float_value AS fv
	ON p.id = fv.id
GROUP BY p.address
ORDER BY p.address;