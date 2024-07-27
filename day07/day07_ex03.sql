WITH res AS ((SELECT pz.name, COUNT(*), 'visit' AS action_type
		FROM person_visits AS pv JOIN pizzeria AS pz
				ON pz.id = pv.pizzeria_id
		GROUP BY pz.name
		ORDER BY count DESC)
		UNION
			(SELECT pz.name, COUNT(*), 'order' AS action_type
			FROM person_order AS po JOIN menu AS m
					ON m.id = po.menu_id
				JOIN pizzeria AS pz
					ON pz.id = m.pizzeria_id
			GROUP BY pz.name
			ORDER BY count DESC)
		ORDER BY action_type, count DESC)
SELECT name, SUM(count) AS total_count
FROM res
GROUP BY name
ORDER BY total_count DESC, name;