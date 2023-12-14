-- CTE RECURSIVE

-- with es el nombre de la table en memoria
-- Campos que vamos a tener
WITH RECURSIVE countdown( val ) AS (
	-- Initialization => primer nivel o valores iniciales
	-- values(5)
	SELECT 5 AS val
	UNION
	-- Query recursive
	SELECT val - 1 FROM countdown WHERE val > 1
	
)
-- Select de los campos
SELECT * FROM countdown;

-- HOMEWORK
-- Counter
WITH RECURSIVE counter( val ) AS (
	-- Initialization => primer nivel o valores iniciales
	-- values(5)
	SELECT 1 AS val
	UNION
	-- Query recursive
	SELECT val + 1 FROM counter WHERE val < 10
	
)
-- Select de los campos
SELECT * FROM counter;

-- Multiply
WITH RECURSIVE multiply(base, val, res) AS (
	SELECT 5 AS base, 1 AS val, 5 AS res
	UNION 
	SELECT base, val + 1, (val +1) * base FROM multiply WHERE val < 10
)
SELECT * FROM multiply