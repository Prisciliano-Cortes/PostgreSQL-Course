SELECT
    first_name,
    last_name,
    hire_date,
    CASE
    	WHEN hire_date > now() - INTERVAL '1 year' THEN '1 YEAR OR LESS'
    	WHEN hire_date > now() - INTERVAL '3 year' THEN '1 TO 3 YEARS'
    	WHEN hire_date > now() - INTERVAL '6 year' THEN '3 TO 6 YEARS'
    	
    	ELSE '+ THAN 6 YEARS'
    
    END AS rank_seniority
FROM
    employees ORDER BY hire_date DESC;