-- PUT AN ALIAS TO THE TABLE		
SELECT a.name, a.continent FROM country a;

-- PUT AN ALIAS TO THE TABLE AND ADD SUB QUERIES		
SELECT a.name, a.continent, (SELECT name FROM continent b WHERE b.name = a.continent) FROM country a;

-- PUT AN ALIAS TO THE TABLE AND ADD SUB QUERIES WITH CODE		
SELECT a.name, a.continent, (SELECT "code" FROM continent b WHERE b.name = a.continent) FROM country a;

-- MASSIVE UPDATE
UPDATE country a SET continent = (SELECT "code" FROM continent b WHERE b.name = a.continent);

SELECT * FROM country;