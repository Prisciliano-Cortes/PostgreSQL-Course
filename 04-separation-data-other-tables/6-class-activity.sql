
-- HOMEWORK WITH TABLE COUNTRY-LANGUAGE 


-- SEQUENCE AND DEFINED TYPE
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- CREATE TABLE LANGUAGE
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- CREATE A COLUMN IN TABLE COUNTRY-LANGUAGE
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);

-- INSERT DATA IN TABLE LANGUAGE
INSERT INTO "language" (name) SELECT DISTINCT "language" FROM countrylanguage ORDER BY "language" ASC;

SELECT * FROM "language"


-- START WITH THE SELECT TO CONFIRM WHAT WE ARE GOING TO UPDATE
SELECT "language", (SELECT code from "language" b WHERE a."language" = b."name") FROM countrylanguage a;


-- UPDATE ALL RECORDS
UPDATE countrylanguage a SET languagecode = (SELECT code from "language" b WHERE a."language" = b."name")


-- CHANGE DATA TYPE IN TABLE COUNTRY-LANGUAGE  - LANGUAGE-CODE TO INT4 
ALTER TABLE  countrylanguage ALTER COLUMN languagecode TYPE int4 USING languagecode::integer;


-- CREATE THE FOREIGN KEY AND NON-NULL CONSTRAINS OF THE LANGUAGE_CODE
ALTER TABLE "public"."countrylanguage" ADD FOREIGN KEY ("languagecode") REFERENCES "public"."language" ("code");

-- REVIEW WHAT WAS CREATED
SELECT * FROM countrylanguage;