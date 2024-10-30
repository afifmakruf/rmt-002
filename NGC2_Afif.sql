-- CREATE TABLE employees (
-- 	employee_id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(50) NOT NULL,
-- 	last_name VARCHAR(50) NOT NULL,
-- 	departement_id INTEGER NOT NULL,
-- 	created_at TIMESTAMP NOT NULL,
-- 	updated_at TIMESTAMP NULL
-- )

SELECT * FROM employees

-- CREATE TABLE departements (
-- 	departement_id SERIAL PRIMARY KEY,
-- 	departement_name VARCHAR(100) NOT NULL,
-- 	created_at TIMESTAMP NOT NULL,
-- 	updated_at TIMESTAMP NULL
-- )

-- INSERT INTO employees (first_name, last_name, departement_id, created_at)
-- VALUES ('John', 'Doe', 1, CURRENT_TIMESTAMP),
-- ('Jane', 'Smith', 2, CURRENT_TIMESTAMP)

-- INSERT INTO departements (departement_name, created_at)
-- VALUES ('Human Resourcing', CURRENT_TIMESTAMP),
-- ('Engineering', CURRENT_TIMESTAMP)

-- UPDATE employees
-- SET last_name = 'Doe-Smith', updated_at = CURRENT_TIMESTAMP
-- WHERE employee_id = 1;

-- ALTER TABLE departements
-- ADD COLUMN deleted_at TIMESTAMP NULL

-- TRUNCATE TABLE departements;
