CREATE VIEW v_generated_dates
	AS SELECT CAST(generated_date AS DATE)
		FROM generate_series('2022-01-01'::TIMESTAMP, '2022-01-31', '1 days') AS generated_date
		ORDER BY generated_date;