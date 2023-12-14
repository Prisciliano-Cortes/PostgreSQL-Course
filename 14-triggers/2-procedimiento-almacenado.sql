CREATE OR REPLACE PROCEDURE  user_login( user_name VARCHAR, user_password VARCHAR)
AS $$
DECLARE
	was_found BOOLEAN;
	
BEGIN
	SELECT COUNT(*) INTO was_found FROM "user" WHERE username = user_name AND password = crypt(user_password, "password");
	
	IF( was_found = FALSE ) THEN
		RAISE EXCEPTION 'User and password as not correct';
	END IF;
	
	UPDATE "user" SET last_login = now() WHERE username = user_name;
	
	COMMIT; 
	
	RAISE NOTICE 'Usuario encontrado %', was_found;
END;
$$
LANGUAGE plpgsql;

CALL user_login('Prisciliano', '123456')

SELECT * FROM "user"



-- HOMEWORK. INSERT DATA FAILED USER
CREATE OR REPLACE PROCEDURE  user_login( user_name VARCHAR, user_password VARCHAR)
AS $$
DECLARE
	was_found BOOLEAN;
	
BEGIN
	SELECT COUNT(*) INTO was_found FROM "user" WHERE username = user_name AND password = crypt(user_password, "password");
	
	IF( was_found = FALSE ) THEN
		INSERT INTO session_failed(username, "when") VALUES (user_name, now());
		COMMIT;
		
		RAISE EXCEPTION 'User and password as not correct';
	END IF;
	
	UPDATE "user" SET last_login = now() WHERE username = user_name;
	
	COMMIT; 
	
	RAISE NOTICE 'Usuario encontrado %', was_found;
END;
$$
LANGUAGE plpgsql;

CALL user_login('Prisciliano', '123456 ');

SELECT * FROM "user";

SELECT * FROM session_failed;