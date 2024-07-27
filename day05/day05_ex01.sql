SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT m.pizza_name, pz.name AS pizzeria_name
FROM menu AS m JOIN pizzeria AS pz
	ON pz.id = m.pizzeria_id;