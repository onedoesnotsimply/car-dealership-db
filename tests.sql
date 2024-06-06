-- 1. Get all dealerships
SELECT * FROM dealerships;

-- 2. Find all vehicles from a specific dealership
SELECT * FROM vehicles WHERE vin IN (SELECT vin FROM inventory WHERE dealership_id = 1);

-- 3. Find a car by VIN
SELECT * FROM vehicles WHERE vin = 1111;

-- 4. Find the dealership where a car is located by VIN
SELECT name FROM dealerships WHERE dealership_id = (SELECT dealership_id FROM inventory WHERE vin = 1111);

-- 5. Find all dealerships that have a certain type of car
SELECT * FROM dealerships WHERE dealership_id = (SELECT dealership_id FROM inventory WHERE vin = (SELECT vin FROM vehicles WHERE color = "Pink" AND make = "Toyota" AND model = "Prius"));

-- 6. Get all sales information for a dealership for a specific date range
SELECT * FROM sales_contracts WHERE dealership_id = 1 AND sales_date BETWEEN '2022-01-01' AND '2024-06-06';