# Employee-Management-Project

## Project Overview

The Employee Management System (EMS) simulates how organizations store and manage employee records in a structured database. The goal of this project is to design a relational database and use SQL queries to retrieve and analyze employee data.

## Dataset Description

The project database contains six tables.

Employees
Stores employee information such as name, email, department, job role, and employment status.

Departments
Contains department names and locations.

Jobs
Stores job roles and salary ranges.

Salaries
Tracks employee salary records.

Attendance
Records daily attendance status for employees.

Performance
Stores employee performance ratings and review comments.

## Database Design

The database was designed using a relational schema where tables are connected using primary keys and foreign keys.

See ER Diagram

## Project Workflow

Created the project database.

Designed tables using CREATE TABLE.

Imported employee data.

Explored the data using SQL queries.

Filtered and analyzed employee records.

Generated insights from the query results.

## Findings

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
