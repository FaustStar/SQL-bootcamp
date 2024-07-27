SELECT p.id AS "person.id",
	p.name AS "person.name",
	p.age,
	p.gender,
	p.address,
	pz.id AS "pizzeria.id",
	pz.name AS "pizzeria.name",
	pz.rating
FROM person AS p CROSS JOIN pizzeria AS pz
ORDER BY p.id, pz.id;