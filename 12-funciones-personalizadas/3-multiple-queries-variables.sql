-- FUNCTION WITH MULTIPLE QUERIES
CREATE OR REPLACE FUNCTION max_raise_2( empl_id INT ) 
RETURNS NUMERIC(8,2)
AS $$
DECLARE -- All variables
	employee_job_id INT;
	current_salary NUMERIC(8,2);
	job_max_salary NUMERIC(8,2);
	possible_raise NUMERIC(8,2);
	
BEGIN
	-- Tomar el puesto de trabajo y el salario
	SELECT job_id, salary INTO employee_job_id, current_salary FROM employees WHERE employee_id = empl_id;
	
	-- Tomar el max salary, acorde a su job
	SELECT max_salary INTO job_max_salary FROM jobs WHERE job_id = employee_job_id;
	
	-- Cálculos
	possible_raise = job_max_salary - current_salary;
	
	RETURN possible_raise;
END;
$$
LANGUAGE plpgsql;


SELECT employee_id, first_name, salary, max_raise(employee_id), max_raise_2( employee_id ) FROM employees INNER JOIN jobs ON jobs.job_id = employees.job_id;
