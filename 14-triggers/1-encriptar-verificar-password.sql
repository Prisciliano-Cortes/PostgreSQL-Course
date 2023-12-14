
-- CREATE TABLE USER AND INSERT DATA 
-- NEVER INSERT PASSWORD WITHOUT ENCRYPT
INSERT INTO "user"(username, password) VALUES('Prisciliano', '123456');

SELECT * FROM "user";

-- INSTALL EXTENSION FOR ENCRYPT DATA
CREATE EXTENSION pgcrypto;

-- ENCRYPT PASSWORD
INSERT INTO "user"(username, password) VALUES('Prisciliano', crypt('123456', gen_salt('bf')));

SELECT * FROM "user";

--DECRYPT PASSWORD
SELECT * FROM "user" WHERE username = 'Prisciliano' AND password = crypt('123456', "password")