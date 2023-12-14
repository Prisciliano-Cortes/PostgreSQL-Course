-- SELECT IF EXIST EXTENSION
SELECT * FROM pg_extension

-- DELETE EXTENSION
DROP EXTENSION "uuid-ossp";

-- DROP ALL TABLES IN CASCADE
DROP TABLE "public"."city" CASCADE;

DROP TABLE "public"."continent" CASCADE;

DROP TABLE "public"."countries" CASCADE;

DROP TABLE "public"."country" CASCADE;

DROP TABLE "public"."countrylanguage" CASCADE;

DROP TABLE "public"."departments" CASCADE;

DROP TABLE "public"."dependents" CASCADE;

DROP TABLE "public"."employees" CASCADE;

DROP TABLE "public"."jobs" CASCADE;

DROP TABLE "public"."language" CASCADE;

DROP TABLE "public"."locations" CASCADE;

DROP TABLE "public"."regions" CASCADE;

DROP TABLE "public"."users" CASCADE;

DROP TABLE "public"."users2" CASCADE;

DROP TABLE "public"."users3" CASCADE;

DROP TABLE "public"."users4" CASCADE;

DROP TABLE "public"."users5" CASCADE;