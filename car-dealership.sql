-- Creating Sales Invoices table
CREATE TABLE sales_invoices(
	sales_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	vin_id VARCHAR(100),
	FOREIGN KEY(vin_id) REFERENCES cars(vin_id),
	sales_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
	price NUMERIC(8,2)
	
);

--Creating Salesperson table
CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
	
);

--Creating Customers table
CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	address VARCHAR(150),
	email VARCHAR(150),
	billing_info VARCHAR(30)
);

--Creating Cars table
CREATE TABLE cars(
	vin_id VARCHAR(100) PRIMARY KEY,
	car_make VARCHAR(100),
	car_model VARCHAR(100),
	year_ NUMERIC(6,2),
	color VARCHAR(50),
	new_or_used VARCHAR(5)
);

-- Creating service invoices table
CREATE TABLE service_invoices(
	service_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
	vin_id VARCHAR(100),
	FOREIGN KEY(vin_id) REFERENCES cars(vin_id),
	service_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
	price NUMERIC(8,2)
	
	
);

-- Creating Service Ticket
CREATE TABLE services_tickets(
	ticket_id SERIAL PRIMARY KEY,
	mechanic_id INTEGER,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	service_id INTEGER,
	FOREIGN KEY(service_id) REFERENCES service_invoices(service_id)
	
);

--Creating Mechanic Ticket
CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

--START INSERT HERE

INSERT INTO sales_invoices(
    sales_id,
    customer_id,
    salesperson_id,
    vin_id,
    price
)VALUES(
    666666,
    100,
    1,
    'JN3K2F29S',
    100000.00
),(
    777777,
    101,
    2,
    'JKEN99EU3',
    30233.00
),(
   888888,
   102,
   2,
   'J0E239EC3',
   30233.00
),(
   999999,
   103,
   1,
   'NFE897NJW',
   30000.00
)

INSERT INTO customers(

	customer_id,
	first_name,
	last_name, 
	address,
	email,
	billing_info
)
VALUES(
	100,
	'Hong',
	'Gao',
	'honggao@gmail.com',
	'1234 Brooklyn NY',
	'1234ABCD'
),(
	101,
	'Marcus',
	'Lee',
	'marcuslee@gmail.com',
	'4321 Santokyo CA',
	'4321DCBA'
),(
	102,
	'Timothy',
	'Wong',
	'TimothyWong@gmail.com',
	'5678 Chicago IL',
	'5678PPPP'
),(
	103,
	'Crystal',
	'Rand',
	'Crystalrand@gmail.com',
	'9999 Bronx NY',
	'99991111'
)

INSERT INTO salesperson(
	
	salesperson_id,
	first_name,
	last_name
	
)VALUES(
	1,
	'Nate',
	'Water'
),(
	2,
	'Eric',
	'Liang'
)

INSERT INTO cars(
 
	vin_id,
	car_make,
	car_model,
	year_,
	color,
	new_or_used
)VALUES(
	'JN3K2F29S',
	'Honda',
	'model 1',
	'2009',
	'Red',
	'New'
	
),(
	'JKEN99EU3',
	'Honda',
	'model 2',
	'2011',
	'Green',
	'New'
	
),(
	'J0E239EC3',
	'Toyota',
	'model 100',
	'2018',
	'Blue',
	'Old'
),(
	'NFE897NJW',
	'Toyota',
	'model 200',
	'2012',
	'White',
	'New'
)

INSERT INTO service_invoices(
	service_id,
	customer_id,
	vin_id,
	price
)VALUES(
	'111',
	100,
	'JN3K2F29S',
	100000.00
),(
	'222',
	102,
	'J0E239EC3',
    30233.00
	
),(
	'333',
	103,
	'NFE897NJW',
    30000.00
),(
	'444',
	104,
	'NFE897NJW',
    30000.00
)


INSERT INTO services_tickets(
	ticket_id,
	mechanic_id,
	service_id
	
)VALUES(
	'32323',
	'500',
	'111'
	
),(
	'34343',
	'500',
	'222'
),(
	'43940',
	'501',
	'333'
),(
	'32430',
	'502',
	'444'
)

INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name
)VALUES(
	'500',
	'Harry',
	'Steves'
),(
	'501',
	'Bob',
	'John'
),(
	'502',
	'Richard',
	'Dickson'
)

--- FOR FUNCTION EXAMPLES, HERE IS HOW IT WOULD LOOK LIKE

-- FUNCTION FOR MECHANIC
CREATE OR REPLACE FUNCTION add_mechanic(
	_mechanic_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR
)
RETURNS void
AS $$
BEGIN
	INSERT INTO mechanic(mechanic_id, first_name, last_name)
	VALUES(_mechanic_id, _first_name, _last_name);
END;
$$
LANGUAGE plpgsql;

SELECT add_mechanic('503','Winnie', 'Pooh');
SELECT add_mechanic('504','Mickey', 'Disney');

SELECT* 
FROM mechanic
-- as you can see, two mechanics are created!

-- FUNCTION FOR SALESPERSON
CREATE OR REPLACE FUNCTION add_salesperson(
	_salesperson_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR
)
RETURNS void
AS $$
BEGIN
	INSERT INTO salesperson(salesperson_id,first_name, last_name)
	VALUES(_salesperson_id, _first_name, _last_name);
END;
$$
LANGUAGE plpgsql;

-- ADDING SALESPEOPLE
SELECT add_salesperson(3,'Simone', 'Biles');
SELECT add_salesperson(4,'Micheal', 'Phelps');

SELECT *
FROM salesperson
-- OMG look, Simone and Micheal are new employees


