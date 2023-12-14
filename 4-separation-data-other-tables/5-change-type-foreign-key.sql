-- CHANGE TYPE IN TABLE country
ALTER TABLE country ALTER COLUMN continent TYPE int4 USING continent::integer;

-- ADD FOREIGN KEY IN TABLE COUNTRY WITH TABLE CONTINENT
ALTER TABLE "public"."country" ADD FOREIGN KEY ("continent") REFERENCES "public"."continent" ("code");

SELECT * FROM country;