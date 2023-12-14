-- FULL OUTER JOIN
SELECT a."name" AS country_name, a.continent AS continent_code, b."name" AS continent_name FROM country a FULL OUTER JOIN continent b ON a.continent = b.code ORDER BY a."name" desc;