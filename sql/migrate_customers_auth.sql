-- Run this in MySQL Workbench if you already created vanilla_db before username/password were added

USE vanilla_db;

ALTER TABLE Customers ADD COLUMN username VARCHAR(50) UNIQUE AFTER customer_contact;
ALTER TABLE Customers ADD COLUMN password VARCHAR(100) NOT NULL DEFAULT '' AFTER username;

UPDATE Customers SET username = 'lina',   password = 'password123' WHERE customer_id = 1;
UPDATE Customers SET username = 'maya',   password = 'password123' WHERE customer_id = 2;
UPDATE Customers SET username = 'khaled', password = 'password123' WHERE customer_id = 3;
