CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10)
RETURNS TABLE(fibonacci INT) AS $$
	WITH RECURSIVE rec (num, next_num) AS (
		SELECT 0 AS num, 1 AS next_num

		UNION ALL

		SELECT next_num AS num, num + next_num AS next_num
		FROM rec
		WHERE next_num < pstop
	)
	SELECT num
	FROM rec;
$$
LANGUAGE SQL;

SELECT * FROM fnc_fibonacci(100);

SELECT * FROM fnc_fibonacci();