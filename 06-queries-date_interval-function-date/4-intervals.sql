SELECT
    MAX(hire_date),
    MAX(hire_date) + INTERVAL '1 days' AS days,
    MAX(hire_date) + INTERVAL '1 month' AS months,
    MAX(hire_date) + INTERVAL '1 year' AS years,
    MAX(hire_date) + INTERVAL '1.1 year' AS years_months,
    MAX(hire_date) + INTERVAL '1.1 year' + INTERVAL '1 day' AS years_months_day,
    date_part('year', now()),
    MAKE_INTERVAL( YEARS := date_part('year', now())::integer ),
    MAX(hire_date) + MAKE_INTERVAL( YEARS := 23)
FROM
    employees;


-- DIFFERENCE BETWEEN DATES AND UPDATES
SELECT
    hire_date,
    MAKE_INTERVAL( YEARS := 2023 - EXTRACT( YEARS FROM hire_date )::INTEGER ) AS manual,
    MAKE_INTERVAL( YEARS := date_part('years', CURRENT_DATE)::INTEGER - EXTRACT( YEARS FROM hire_date )::INTEGER ) AS computer
FROM
    employees ORDER BY hire_date ASC;
    
    
-- HOMEWORK
UPDATE employees SET hire_date = hire_date + INTERVAL '23 years'