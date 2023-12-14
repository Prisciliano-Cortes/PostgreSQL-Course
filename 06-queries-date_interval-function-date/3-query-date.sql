-- QUERIES ABOUT DATE
SELECT * FROM employees WHERE hire_date > date('1998-02-05') ORDER BY hire_date ASC;

SELECT MAX(hire_date) user_new FROM employees;
SELECT MIN(hire_date) user_OLD FROM employees;

SELECT * FROM employees WHERE hire_date BETWEEN '1999-01-01' AND '2000-01-01' ORDER BY hire_date DESC;
