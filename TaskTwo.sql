CREATE DATABASE OCD_SQL_Task2;

CREATE TABLE Manager (
    ManagerID INT IDENTITY(1,1) PRIMARY KEY,
    ManagerName VARCHAR(100),
);

CREATE TABLE departments(
deptID int primary key,
deptName varchar(50));

CREATE TABLE employees(
JobID int primary key,
employeeName varchar(50) not null,
NID int ,
birthday date,
nationality varchar(50),
phoneNumber varchar(15),
maritalStatuse varchar(15),
personalPhoto image,
entryDate date,
password varchar(50),
deptID int,
foreign key (deptID) references departments(deptID));

CREATE TABLE Tasks(
TaskID int primary key,
TaskTitle varchar(50),
TaskStartDate date,
TaskDueDate date,
TaskDescription varchar(300),
levelOfImportance int,
employeeID int,
FOREIGN KEY (employeeID) REFERENCES employees(JobID));

CREATE TABLE Feedbacks(
msgID int primary key,
customerName varchar(50),
email varchar(50),
msgDate date,
msgText varchar(300));
