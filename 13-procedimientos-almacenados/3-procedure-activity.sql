-- CREATE TABLE FOR THIS QUERY
SELECT CURRENT_DATE AS "date", salary, max_raise(employee_id), max_raise(employee_id) * 0.05 AS amount, 5 AS percentage FROM employees;


-- CREATE A TABLE FOR REGISTER HISTORY

DROP TABLE IF EXISTS "public"."raise_history";

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS raise_history_id_seq;

-- Table Definition
CREATE TABLE "public"."raise_history" (
    "id" int4 NOT NULL DEFAULT nextval('raise_history_id_seq'::regclass),
    "date" date,
    "employee_id" int4,
    "base_salary" numeric(8,2),
    "amount" numeric(8,2),
    "percentage" numeric(4,2),
    PRIMARY KEY ("id")
);