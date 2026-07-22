CREATE TABLE customers(
cID int primary key,
cName varchar(50) not null,
cAge int )

CREATE TABLE orders(
oId int primary key,
cID int ,
oDate date,
totalAmount float,
foreign key(cID) references customers (cID));

CREATE TABLE Products(
pID int primary key,
pName varchar(50),
pDescription varchar(200),
price float)

CREATE TABLE Employees(
eID int primary key,
eName varchar(50),
jobTitle varchar(100),
salary float)

INSERT INTO customers
VALUES (1,'Lina',20);

INSERT INTO orders
VALUES (1, 1, '2026-07-20', 10.5);

INSERT INTO Products
VALUES (101, 'Laptop', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.' , 45)

INSERT INTO Employees
VALUES (1, 'Ali', 'Manager', 1200);

INSERT INTO customers
VALUES (2,'Ahmad',25);

INSERT INTO customers
VALUES (3,'Sara',22);

INSERT INTO customers
VALUES (4,'Omar',30);

INSERT INTO customers
VALUES (5,'Noor',27);

INSERT INTO orders
VALUES (2, 2, '2026-07-21', 25.75);

INSERT INTO orders
VALUES (3, 3, '2026-07-22', 15.00);

INSERT INTO orders
VALUES (4, 4, '2026-07-23', 50.25);

INSERT INTO orders
VALUES (5, 5, '2026-07-24', 100.00);

INSERT INTO Products
VALUES (102, 'Mouse', 'Wireless optical mouse with ergonomic design.', 25);

INSERT INTO Products
VALUES (103, 'Keyboard', 'Mechanical keyboard with RGB backlight.', 60);

INSERT INTO Products
VALUES (104, 'Monitor', '24-inch Full HD IPS monitor.', 180);

INSERT INTO Products
VALUES (105, 'Headphones', 'Noise-cancelling wireless headphones.', 95);

INSERT INTO Employees
VALUES (2, 'Sara', 'Developer', 1500);

INSERT INTO Employees
VALUES (3, 'Omar', 'Designer', 1300);

INSERT INTO Employees
VALUES (4, 'Noor', 'Sales', 900);

INSERT INTO Employees
VALUES (5, 'Ahmad', 'Accountant', 1100);