-- JOINS

--INNER JOIN 
SELECT a."name" AS country_name, b."name" AS continent_name FROM country a INNER JOIN continent b ON a.continent = b.code ORDER BY a."name" ASC;

-- RESTART SEQUENCE ID IN TABLE CONTINENT	
ALTER SEQUENCE continent_code_seq RESTART WITH 8
