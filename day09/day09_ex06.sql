CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR DEFAULT 'Dmitriy',
	pprice NUMERIC DEFAULT 500, pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE(name VARCHAR) AS $$
	BEGIN
		RETURN QUERY
			SELECT pz.name AS pizzeria_name
			FROM menu AS m
				JOIN pizzeria AS pz
				ON pz.id = m.pizzeria_id
			WHERE pz.id IN (
					SELECT pv.pizzeria_id
					FROM person_visits AS pv
						JOIN person AS p
						ON p.id = pv.person_id
					WHERE p.name = pperson AND pv.visit_date = pdate)
				AND m.price < pprice;
	END;
$$
LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');