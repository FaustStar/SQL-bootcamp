SELECT name
FROM pizzeria
WHERE id NOT IN (SELECT pizzeria_id
	FROM person_visits);

SELECT pz.name
FROM pizzeria AS pz
WHERE NOT EXISTS (SELECT 1 -- EXISTS returns only 1 (true) or 0 (false)
	FROM person_visits AS pv
	WHERE pv.pizzeria_id = pz.id);