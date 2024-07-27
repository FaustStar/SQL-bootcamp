INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
	WITH order_amount AS (SELECT po.person_id, m.pizzeria_id, COUNT(*) AS amount
				FROM person_order AS po JOIN menu AS m
					ON m.id = po.menu_id
				GROUP BY po.person_id, m.pizzeria_id)
	SELECT
		ROW_NUMBER() OVER() AS id,
		person_id,
		pizzeria_id,
		CASE
			WHEN amount = 1 THEN 10.5
			WHEN amount = 2 THEN 22
			ELSE 30
		END
	FROM order_amount;