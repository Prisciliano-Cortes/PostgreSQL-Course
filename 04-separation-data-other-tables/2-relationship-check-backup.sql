-- VIEW IN THIS LESSON
-- 1. MASSIVE UPDATES
-- 2. INFORMATION CREATION AND DUMP
-- 3. ALTERATION OF INDICES AND CHECKS
-- 4. ELIMINATION OF CHECKS
-- 5. MODIFICATION OF COLUMNS USING GUI AND MANUALLY
-- 6. TABLE CREATION
-- 7. RELATIONS

-- TABLE COUNTRY BACKUP
CREATE TABLE "public"."country_bk" (
    "code" bpchar NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL CHECK ((continent = 'Asia'::text) OR (continent = 'South America'::text) OR (continent = 'North America'::text) OR (continent = 'Oceania'::text) OR (continent = 'Antarctica'::text) OR (continent = 'Africa'::text) OR (continent = 'Europe'::text) OR (continent = 'Central America'::text)),
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL CHECK (surfacearea >= (0)::double precision),
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric,
    "gnpold" numeric,
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar NOT NULL,
    PRIMARY KEY ("code")
);

-- INSERT DATA IN COUNTRY_BK USING SELECT TABLE COUNTRY	
INSERT INTO country_bk SELECT * FROM country

SELECT * FROM country_bk

SELECT * FROM country

-- DELETE CHECK CONSTRIAN IN TABLE COUNTRY	
ALTER TABLE country DROP CONSTRAINT country_continent_check