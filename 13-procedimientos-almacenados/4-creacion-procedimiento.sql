-- CREATE STORAGE PROCEDURE ADVANCED
CREATE OR REPLACE PROCEDURE controlled_raise (percentage NUMERIC ) AS 
$$
	DECLARE
		real_percentage NUMERIC(8,2);
		total_employees INT;
		
	BEGIN
		real_percentage = percentage / 100;
		
		-- Mantener el histórico
		INSERT INTO raise_history(date, employee_id, base_salary, amount, percentage)
		SELECT CURRENT_DATE AS "date", employee_id, salary, max_raise(employee_id) * real_percentage AS amount, percentage FROM employees;
		
		-- Impactar la tabla de empleados
		UPDATE employees SET salary = max_raise(employee_id) * real_percentage +  salary;
		
		COMMIT;
		
		SELECT COUNT(*) INTO total_employees FROM employees;
		
		RAISE NOTICE 'Affected % employees', total_employees;
	END;
$$
LANGUAGE plpgsql;

-- USE STORAGE PROCEDURE
CALL controlled_raise(1);

-- SELECT TABLE AFFECTED
SELECT * FROM employees;
SELECT * FROM raise_history;