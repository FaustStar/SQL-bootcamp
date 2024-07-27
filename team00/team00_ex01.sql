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
)

SELECT price_sum AS total_cost, regexp_split_to_array(CONCAT(node1, node2), '') AS tour
FROM recursion
WHERE LENGTH(node1) = (SELECT count(DISTINCT point1) FROM paths)
ORDER BY total_cost, tour;