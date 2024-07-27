CREATE TABLE paths ( 
    point1 VARCHAR,
    point2 VARCHAR,
    price  INT
);

INSERT INTO paths (point1, point2, price)
VALUES ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('c', 'd', 30),
    ('d', 'c', 30),
    ('b', 'd', 25),
    ('d', 'b', 25);

WITH RECURSIVE recursion (node1, node2, price_sum) AS (
	-- not recursive part
    SELECT * FROM paths WHERE point1 = 'a'
    
    UNION ALL

	-- recursive part
    SELECT CONCAT(node1, paths.point1) AS node1, point2 AS node2, price_sum + price AS price_sum
    FROM recursion, paths -- the same that CROSS JOIN is
    WHERE (
        CASE 
        WHEN LENGTH(node1) < (SELECT count(DISTINCT point1) - 1 FROM paths) 
            THEN point1 = node2 AND POSITION(point2 IN node1) = 0
        WHEN LENGTH(node1) = (SELECT count(DISTINCT point1) - 1 FROM paths)
            THEN point1 = node2 AND point2 = 'a'
        END
    )
), cte AS (
	SELECT price_sum AS total_cost, regexp_split_to_array(CONCAT(node1, node2), '') AS tour FROM recursion
	WHERE LENGTH(node1) = (SELECT count(DISTINCT point1) FROM paths)
)

SELECT *
FROM cte
WHERE total_cost = (SELECT MIN(total_cost) FROM cte)
ORDER BY total_cost, tour;