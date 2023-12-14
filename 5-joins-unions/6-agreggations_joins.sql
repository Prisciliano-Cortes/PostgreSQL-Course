SELECT COUNT(*), continent FROM country GROUP BY continent ORDER BY continent ASC;

SELECT COUNT(*), b.name FROM country a INNER JOIN continent b ON a.continent = b.code GROUP BY b.name ORDER BY COUNT(*) ASC;

SELECT COUNT(*), b.name FROM country a RIGHT JOIN continent b ON a.continent = b.code WHERE a.continent IS NULL GROUP BY b.name ORDER BY COUNT(*) ASC;

--LARGE SOLUTION USING UNION FOR TWO QUERIES
(SELECT COUNT(*) as total_count, b.name FROM country a INNER JOIN continent b ON a.continent = b.code GROUP BY b.name)
UNION
(SELECT 0 AS total_count, b.name FROM country a RIGHT JOIN continent b ON a.continent = b.code WHERE a.continent IS NULL GROUP BY b.name) ORDER BY total_count ASC;

-- SHORT SOLUTION
SELECT COUNT(a.code) total, b."name" AS continent FROM country a RIGHT JOIN continent b ON a.continent = b.code GROUP BY b."name" ORDER BY total ASC;



-- HOMEWORK
(SELECT COUNT(*) AS total_country, b."name" AS country_name FROM country a INNER JOIN continent b ON a.continent = b.code WHERE b."name" NOT LIKE '%America%' GROUP BY country_name)
UNION
(SELECT COUNT(*) as  total_country, 'America' FROM country a INNER JOIN continent b ON a.continent = b.code WHERE b."name" LIKE '%America%') ORDER BY total_country ASC;


SELECT COUNT(*) AS total_city, b.name AS country_name FROM city a INNER JOIN country b ON a.countrycode = b.code GROUP BY b.name ORDER BY total_city DESC LIMIT 1;