-- Step 1: Create Employee Table
CREATE TABLE employee (
   emp_id SERIAL PRIMARY KEY,
   first_name VARCHAR(100) NOT NULL,
   last_name VARCHAR(100) NOT NULL,
   email VARCHAR(255) UNIQUE NOT NULL,
   hire_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
   updated_at TIMESTAMPTZ
);

-- Step 2: View All Employees
SELECT * FROM employee;

-- Step 3: Drop Table If Exists
DROP TABLE IF EXISTS employee;

-- Step 4: Add New Column
ALTER TABLE employee ADD COLUMN is_active BOOLEAN;

-- Step 5: Drop the Column
ALTER TABLE employee DROP COLUMN is_active;

-- Step 6: Rename Column
ALTER TABLE employee RENAME COLUMN email TO work_email;
ALTER TABLE employee RENAME COLUMN work_email TO email;

-- Step 7: Rename Table
ALTER TABLE employee RENAME TO staff;
ALTER TABLE staff RENAME TO employee;

-- Step 8: Create Department Table
CREATE TABLE department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    emp_id INTEGER REFERENCES employee(emp_id),
    assigned_date TIMESTAMPTZ DEFAULT NOW()
);

-- Step 9: Insert One Employee
INSERT INTO employee (first_name, last_name, email, hire_date, updated_at)
VALUES ('Amit', 'Shah', 'amit.shah@example.com', NOW(), NULL);

-- Step 10: Insert Multiple Employees
INSERT INTO employee (first_name, last_name, email, hire_date, updated_at) VALUES
('Neha', 'Singh', 'neha.singh@example.com', NOW(), NULL),
('Ravi', 'Patel', 'ravi.patel@example.com', NOW(), NULL),
('Priya', 'Mehta', 'priya.mehta@example.com', NOW(), NULL),
('Karan', 'Joshi', 'karan.joshi@example.com', NOW(), NULL);

-- Step 11: Insert Department Assignments
INSERT INTO department (dept_name, emp_id) VALUES
('HR', 1),
('Finance', 2),
('IT', 3),
('Sales', 1),
('Marketing', 4);

-- Step 12: Basic SELECTs
SELECT first_name FROM employee;
SELECT first_name, last_name FROM employee;
SELECT * FROM employee;

-- Step 13: ORDER BY
SELECT first_name, last_name FROM employee ORDER BY first_name ASC;
SELECT emp_id, first_name FROM employee ORDER BY first_name ASC, last_name DESC;

-- Step 14: WHERE Clauses
SELECT * FROM employee WHERE first_name = 'Amit';
SELECT * FROM employee WHERE first_name IN ('Neha', 'Ravi');
SELECT * FROM employee WHERE first_name ILIKE '%YA%';

-- Step 15: JOIN
SELECT * FROM department d INNER JOIN employee e ON d.emp_id = e.emp_id;
SELECT * FROM employee e LEFT JOIN department d ON e.emp_id = d.emp_id;

-- Step 16: GROUP BY
SELECT e.emp_id, e.first_name, COUNT(d.dept_id) AS dept_count
FROM employee e
JOIN department d ON e.emp_id = d.emp_id
GROUP BY e.emp_id;

-- Step 17: GROUP BY with HAVING
SELECT e.emp_id, e.first_name, COUNT(d.dept_id) AS dept_count
FROM employee e
JOIN department d ON e.emp_id = d.emp_id
GROUP BY e.emp_id
HAVING COUNT(d.dept_id) > 1;

-- Step 18: Subqueries
SELECT * FROM department WHERE emp_id IN (
  SELECT emp_id FROM employee WHERE first_name LIKE 'A%'
);

SELECT * FROM employee e WHERE EXISTS (
  SELECT 1 FROM department d WHERE d.emp_id = e.emp_id
);

-- Step 19: UPDATE
UPDATE employee
SET first_name = 'Amitabh', email = 'amitabh.shah@example.com'
WHERE emp_id = 1;

-- Step 20: DELETE
DELETE FROM employee WHERE emp_id = 5;
