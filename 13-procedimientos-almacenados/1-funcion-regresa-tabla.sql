

-- FUNCTIONS AND STORED PROCEDURES

SELECT country_id, country_name, region_name FROM countries INNER JOIN regions ON countries.region_id = regions.region_id;


-- CREATE FUNCTIONS
CREATE OR REPLACE FUNCTION country_region()
	RETURNS TABLE( id CHARACTER(2), name VARCHAR(40), region VARCHAR(25) )
	AS $$
	BEGIN
		RETURN QUERY
			SELECT country_id, country_name, region_name FROM countries INNER JOIN regions ON countries.region_id = regions.region_id;
	END;
	$$
	LANGUAGE plpgsql;


SELECT * FROM country_region()