-- MULTIPLE JOINS

-- WHICH OFFICIAL LANGUAGES ARE SPOKEN BY CONTINENT
SELECT DISTINCT a."language", c."name" FROM countrylanguage a INNER JOIN country b ON a.countrycode = b.code INNER JOIN continent c ON b.continent = c.code WHERE a.isofficial IS TRUE;

-- HOW MANY OFFICIAL LANGUAGES ARE SPOKEN PER CONTINENT 
SELECT COUNT(*), continent FROM (
SELECT DISTINCT a."language", c."name" AS continent FROM countrylanguage a INNER JOIN country b ON a.countrycode = b.code INNER JOIN continent c ON b.continent = c.code WHERE a.isofficial IS TRUE
) AS totales GROUP BY continent;

-- USING WITH TABLE LANGUAGE
SELECT DISTINCT a."language", d.name, c."name" FROM countrylanguage a INNER JOIN country b ON a.countrycode = b.code INNER JOIN continent c ON b.continent = c.code INNER JOIN "language" d ON d.code = a.languagecode WHERE a.isofficial IS TRUE;

-- HOMEWORK

--WHAT IS THE OFFICIAL LANGUAGE (AND LANGUAGE CODE) MOST SPOKEN BY DIFFERENT COUNTRIES IN EUROPE?
SELECT COUNT(*), b.languagecode, b."language" FROM country a INNER JOIN countrylanguage b ON a.code = b.countrycode WHERE a.continent = 5 AND b.isofficial IS TRUE GROUP BY b.languagecode, b."language";

SELECT COUNT(*) AS total_count, b.languagecode, b."language" FROM country a INNER JOIN countrylanguage b ON a.code = b.countrycode WHERE a.continent = 5 AND b.isofficial IS TRUE GROUP BY b.languagecode, b."language" ORDER BY total_count DESC LIMIT 1;

-- LIST OF ALL THE COUNTRIES WHOSE OFFICIAL LANGUAGE IS THE MOST SPOKEN IN EUROPE
SELECT * FROM country a INNER JOIN countrylanguage b ON a.code = b.countrycode WHERE a.continent = 5 AND b.isofficial IS TRUE AND b.languagecode = 135