-- CREATE SEQUENCE
CREATE SEQUENCE user_sequence;

-- DELETE A SEQUENCE
DROP SEQUENCE user_sequence;

SELECT nextval('user_sequence');

SELECT nextval('user_sequence'), currval('user_sequence');

SELECT currval('user_sequence'), nextval('user_sequence'), currval('user_sequence');

CREATE TABLE users6 (
	"user_id" INTEGER PRIMARY KEY DEFAULT nextval('user_sequence'),
	"username" VARCHAR
)