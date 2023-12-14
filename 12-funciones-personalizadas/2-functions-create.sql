
-- FUNCTIONS

SELECT GREATEST(1,2,30,5); -- Return value most great

SELECT COALESCE(null, 'Hello world'); -- Return value different to null


-- CREATE FUNCTIONS
CREATE OR REPLACE FUNCTION greet_employee( employee_name VARCHAR ) RETURNS VARCHAR AS 
$$
BEGIN
	RETURN 'Hello ' || employee_name;
END;
$$
LANGUAGE plpgsql;

-- USE FUNCTIONS
SELECT greet_employee('Pris');
SELECT first_name, greet_employee(first_name) FROM employees;

-- EXERCISE WITHOUT FUNCTION
SELECT employee_id, first_name, salary, max_salary - salary AS possible_raise FROM employees INNER JOIN jobs ON jobs.job_id = employees.job_id


-- CREATE A FUNCTION FOR RESOLVER PROBLEM
CREATE OR REPLACE FUNCTION max_raise( empl_id INT ) 
RETURNS NUMERIC(8,2)
AS $$
DECLARE -- All variables
	possible_raise NUMERIC(8,2);
	
BEGIN
	SELECT
		max_salary - salary INTO possible_raise
	FROM employees
	INNER JOIN jobs ON jobs.job_id = employees.job_id WHERE employee_id = empl_id;
	
	RETURN possible_raise;
END;
$$
LANGUAGE plpgsql;

-- USE FUNCTION CREATED
SELECT max_raise(206);
SELECT employee_id, first_name, salary, max_raise(employee_id) FROM employees INNER JOIN jobs ON jobs.job_id = employees.job_id;
SELECT employee_id, first_name, max_raise(employee_id) FROM employees;