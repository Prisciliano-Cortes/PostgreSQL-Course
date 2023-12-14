-- Create BD employees and register data when organizational structure
SELECT * FROM employees;


WITH RECURSIVE bosses AS (
	-- init
	SELECT id, name, reports_to FROM employees WHERE id = 1
	UNION
	-- recursive
	SELECT employees.id, employees.name, employees.reports_to from employees INNER JOIN bosses ON bosses.id = employees.reports_to
)

SELECT * FROM bosses;

-- Example with DEPTH
WITH RECURSIVE bosses AS (
	-- init
	SELECT id, name, reports_to, 1 AS depth  FROM employees WHERE id = 1
	UNION
	-- recursive
	SELECT employees.id, employees.name, employees.reports_to, depth + 1 from employees INNER JOIN bosses ON bosses.id = employees.reports_to
)

SELECT * FROM bosses

-- Example with DEPTH AND WHERE
WITH RECURSIVE bosses AS (
	-- init
	SELECT id, name, reports_to, 1 AS depth  FROM employees WHERE id = 1
	UNION
	-- recursive
	SELECT employees.id, employees.name, employees.reports_to, depth + 1 from employees INNER JOIN bosses ON bosses.id = employees.reports_to WHERE depth < 4
)

SELECT * FROM bosses;


-- VIEW NAME EMPLOYEES
WITH RECURSIVE bosses AS (
	-- init
	SELECT id, name, reports_to, 1 AS depth  FROM employees WHERE id = 1
	UNION
	-- recursive
	SELECT employees.id, employees.name, employees.reports_to, depth + 1 from employees INNER JOIN bosses ON bosses.id = employees.reports_to WHERE depth < 5
)

SELECT bosses.*, employees.name AS reports_to_name FROM bosses LEFT JOIN employees ON employees.id = bosses.reports_to ORDER BY DEPTH