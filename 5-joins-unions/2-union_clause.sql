SELECT * FROM continent

SELECT * FROM continent WHERE code IN (4, 6, 8)

SELECT * FROM continent WHERE name LIKE '%America%'

-- IN THE UNIONS - THEY MUST HAVE THE SAME NUMBER OF COLUMNS AND THEY MUST BE IN THE SAME ORDER
SELECT * FROM continent WHERE code IN (3, 5) UNION SELECT * FROM continent WHERE name LIKE '%America%' ORDER BY name ASC;

-- USING CLAUSE WHERE
SELECT a.name AS countryName, b.name AS continentName FROM country a, continent b WHERE a.continent = b.code ORDER BY b.name ASC;