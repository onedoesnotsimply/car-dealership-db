-- Drop the database if it exists, create it if it doesn't

DROP DATABASE IF EXISTS cardealerships;

CREATE DATABASE IF NOT EXISTS cardealerships;

USE cardealerships;

-- Create tables

CREATE TABLE `dealerships` (
`dealership_id` INT NOT NULL AUTO_INCREMENT,
`name` varchar(50),
`address` varchar(50),
`phone` varchar(12),
PRIMARY KEY(`dealership_id`)
);

CREATE TABLE `vehicles` (
`vin` INT NOT NULL,
`make` varchar(50),
`model` varchar(50),
`color` varchar(50),
`odometer` INT,
`price` DOUBLE,
`sold` BOOL,
PRIMARY KEY(`vin`)
);

CREATE TABLE `inventory` (
`dealership_id` INT,
`vin` INT
);

CREATE TABLE `sales_contracts` (
`sales_id` INT NOT NULL AUTO_INCREMENT,
`vin` INT,
`sales_date` DATE,
`dealership_id` INT,
PRIMARY KEY(`sales_id`),
FOREIGN KEY(`vin`) REFERENCES vehicles(vin),
FOREIGN KEY(`dealership_id`) REFERENCES dealerships(dealership_id)
);


-- Truncate all data
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE dealerships;
TRUNCATE TABLE vehicles;
TRUNCATE TABLE sales_contracts;
SET FOREIGN_KEY_CHECKS = 1;
TRUNCATE TABLE inventory;

-- Add data to dealerships
INSERT INTO dealerships VALUES(1, 'B & D Motors', '123 Somewhere', '888-999-1010');
INSERT INTO dealerships VALUES(2, 'Harney & Sons', '999 Another St', '999-222-2932');

-- Add data to vehicles
INSERT INTO vehicles VALUES(1111, 'Ford', 'Explorer', 'Red', 130000, 13000.0, false);
INSERT INTO vehicles VALUES(1212, 'Jeep', 'Wrangler', 'Black', 54000, 25999.98, false);
INSERT INTO vehicles VALUES(1232, 'Toyota', 'Prius', 'Pink', 230000, 7000.24, true);

-- Add data to inventory
INSERT INTO inventory VALUES(2, 1111);
INSERT INTO inventory VALUES(1, 1212);
INSERT INTO inventory VALUES(1, 1232);

-- Add data to sales_contracts
INSERT INTO sales_contracts VALUES(1, 1232, '2024-02-20', 1);