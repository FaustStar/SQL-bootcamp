DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE(id BIGINT, name VARCHAR, age INT, gender VARCHAR, address VARCHAR) AS $$
	SELECT *
	FROM person
	WHERE gender = pgender; --instead of pgender $1 can be used
$$
LANGUAGE SQL;

SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();