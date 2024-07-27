WITH sum_amount AS (SELECT user_id, type, SUM(money) AS volume
		FROM balance
		GROUP BY user_id, type),
	last_rate AS (SELECT b.currency_id, c.rate_to_usd
		FROM balance AS b JOIN currency AS c
			ON c.id = b.currency_id
		WHERE c.updated = (SELECT MAX(updated)
							FROM currency
							WHERE id = b.currency_id)
		GROUP BY b.currency_id, c.rate_to_usd)

SELECT COALESCE(u.name, 'not defined') AS name,
	COALESCE(u.lastname, 'not defined') AS lastname,
	b.type,
	sa.volume,
	COALESCE(c.name, 'not defined') AS currency_name,
	COALESCE(lr.rate_to_usd, 1) AS last_rate_to_usd,
	(sa.volume * COALESCE(lr.rate_to_usd, 1)) AS total_volume_in_usd
FROM "user" AS u FULL JOIN balance AS b
		ON u.id = b.user_id
	FULL JOIN currency AS c
		ON c.id = b.currency_id
	FULL JOIN sum_amount AS sa
		ON sa.user_id = b.user_id AND sa.type = b.type
	FULL JOIN last_rate AS lr
		ON lr.currency_id = b.currency_id
GROUP BY u.name, u.lastname, b.type, sa.volume, currency_name, last_rate_to_usd, total_volume_in_usd
ORDER BY name DESC, lastname, b.type;