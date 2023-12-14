SELECT 'PRISCILIANO' AS name;

SELECT (SELECT COUNT(*) FROM employees) AS total;

SELECT (SELECT COUNT(*) FROM employees) AS total, (SELECT SUM(salary) FROM employees) as total_salary;


-- BASIC FUNCTION DATE

-- DATE OF DB
SELECT NOW();

-- DATE IN THE MOMENT
SELECT CURRENT_DATE;

-- TIME IN THE MOMENT
SELECT CURRENT_TIME;

-- EXTRACT DATEA DN TIME
SELECT date_part('hours', now()) as hours;
SELECT date_part('minutes', now()) as minutes;
SELECT date_part('seconds', now()) as seconds;
SELECT date_part('days', now()) as days;
SELECT date_part('months', now()) as months;
SELECT date_part('years', now()) as years;