-- Employee login credentials (staff accounts are created by the company, not self-signup)
USE vanilla_db;

ALTER TABLE Employee ADD COLUMN username VARCHAR(20) NULL;
ALTER TABLE Employee ADD COLUMN password VARCHAR(100) NULL;

UPDATE Employee SET username = 'emp0001', password = 'Manager@1' WHERE employee_id = 1;
UPDATE Employee SET username = 'emp0002', password = 'Cashier@2' WHERE employee_id = 2;
UPDATE Employee SET username = 'emp0003', password = 'Barista@3' WHERE employee_id = 3;
UPDATE Employee SET username = 'emp0004', password = 'Manager@4' WHERE employee_id = 4;
UPDATE Employee SET username = 'emp0005', password = 'Cashier@5' WHERE employee_id = 5;

ALTER TABLE Employee MODIFY username VARCHAR(20) NOT NULL;
ALTER TABLE Employee ADD UNIQUE KEY uk_employee_username (username);

-- Update test customers to meet password policy
UPDATE Customers SET password = 'Customer@1' WHERE username = 'lina';
UPDATE Customers SET password = 'Customer@2' WHERE username = 'maya';
UPDATE Customers SET password = 'Customer@3' WHERE username = 'khaled';

SELECT employee_id, username, first_name, last_name, employee_position FROM Employee;
