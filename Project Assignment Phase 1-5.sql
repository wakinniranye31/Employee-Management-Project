CREATE DATABASE ProjectAss;

SHOW DATABASES;

USE ProjectAss;

-- Create tables --
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY AUTO_INCREMENT,
    JobTitle VARCHAR(50) UNIQUE NOT NULL,
    MinSalary DECIMAL(15,2),
    MaxSalary DECIMAL(15,2)
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50) UNIQUE NOT NULL,
    Location VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('M','F')),
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20) UNIQUE,
    HireDate DATE NOT NULL,
    JobID INT,
    DepartmentID INT,
    ManagerID INT,
    Status VARCHAR(20) CHECK(Status IN ('Active','Inactive','On Leave')),
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DeptID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    SalaryAmount DECIMAL(15,2) NOT NULL,
    FromDate DATE NOT NULL,
    ToDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    AttendanceDate DATE NOT NULL,
    Status VARCHAR(20) CHECK(Status IN ('Present','Absent','Leave')),
    CheckInTime TIME,
    CheckOutTime TIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Performance (
    PerformanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    ReviewDate DATE NOT NULL,
    Rating INT CHECK(Rating BETWEEN 1 AND 5),
    Comments TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


-- Check table structure --
DESCRIBE Employees;
DESCRIBE Departments;
DESCRIBE Jobs;
DESCRIBE Salaries;
DESCRIBE Attendance;
DESCRIBE Performance;

CREATE TABLE `Job` (
    `JobID`	INT,
    `JobTitle`	VARCHAR(512),
    `MinSalary`	INT,
    `MaxSalary`	INT,
    PRIMARY KEY (`JobID`)
);

SELECT * FROM `jobs`;

SELECT * FROM `departments`;

SELECT * FROM `employees`;

SELECT * FROM `attendance`;

SELECT * FROM `performance`;

SELECT * FROM `salaries`;


-- Show the records of employee by their full names and email --
SELECT CONCAT(FirstName,' ', LastName) AS Full_name, email
FROM `employees`;


-- Find active employees only --
Select * 
from `employees`
where status = 'Active';

-- Find employee who are absent --
SELECT *
FROM Attendance
where status = 'Absent';


-- Find employees from the finance department who are still active --
Select *
From `employees` AS E
join `departments` AS D
on D.DeptID = E.DepartmentID
where DeptName = 'finance'
and status = 'active';


-- employee records who are paid above one hundred thousand --
select *
from `employees` AS E
JOIN `salaries` as S
ON E.EmployeeID = S.EmployeeID
where SalaryAmount > 100000;

-- information about employees from the HR and Finance department --
SELECT * 
FROM `employees` AS E
JOIN `departments` AS D
ON E.DepartmentID = D.DeptID
where DeptName IN ('Human Resources', 'FINANCE');

-- Export records of employees aren’t active --
SELECT *
FROM `employees`
WHERE STATUS != 'Active';

-- attendance records of employees who were present in attendance only in Jan 2026 --
select *
from `employees` as E
join `attendance` AS A
ON E.EmployeeID = a.EmployeeID
WHERE AttendanceDate LIKE '2026-01-%';

-- records of employees from finance department and are still active --
select *
from `employees` as E
JOIN `departments` AS D
ON D.DeptID = E.DepartmentID
WHERE DeptName = 'Finance'
AND Status = 'Active';


-- Order Employees by last name in alphabetical Alphabetically --
SELECT *
FROM `employees`
ORDER BY LastName;

-- records of employees with the Highest Salaries First --
SELECT *
FROM `employees` AS E
join `salaries` AS S
on E.EmployeeID = S.EmployeeID
Order by SalaryAmount Desc;


-- Unique Departments in the organization --
select distinct *
from `departments`;

-- Top 5 Performers --
select * 
from `employees` as E
join `performance` as P
on E.EmployeeID = P.EmployeeID
ORDER BY Rating DESC, ReviewDate DESC
limit 0,5;

-- Next 5 Employees (Pagination) --
select * 
from `employees` as E
join `performance` as P
on E.EmployeeID = P.EmployeeID
ORDER BY Rating DESC, ReviewDate DESC
limit 5,5





