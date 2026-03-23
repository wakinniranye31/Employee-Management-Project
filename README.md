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

![image alt](https://github.com/wakinniranye31/Employee-Management-Project/blob/52bda420384ec460da983e847e87448409a27023/Records%20of%20employee%20by%20their%20full%20names%20and%20email.png)

-- Find active employees only --
Select * 
from `employees`
where status = 'Active';

![image alt](https://github.com/wakinniranye31/Employee-Management-Project/blob/c32348c4c84687ebc317776a09b011602de525a8/Finding%20active%20employees%20only.png)

-- Find employee who are absent --
SELECT *
FROM Attendance
where status = 'Absent';

![image alt](https://github.com/wakinniranye31/Employee-Management-Project/blob/344e3623b3fa9a2abbfc9fef4a9125a834e0ac33/Find%20employee%20who%20are%20absent.png)

-- Find employees from the finance department who are still active --
Select *
From `employees` AS E
join `departments` AS D
on D.DeptID = E.DepartmentID
where DeptName = 'finance'
and status = 'active';

![image alt](https://github.com/wakinniranye31/Employee-Management-Project/blob/539c274a76cf45306516b818be54d2e24504dd37/Find%20employees%20from%20the%20finance%20department%20who%20are%20still%20active.png)

-- employee records who are paid above one hundred thousand --
select *
from `employees` AS E
JOIN `salaries` as S
ON E.EmployeeID = S.EmployeeID
where SalaryAmount > 100000;

![image alt](https://github.com/wakinniranye31/Employee-Management-Project/blob/d408aee704df5595e4e0b79fef453e252dbe399f/Employee%20records%20who%20are%20paid%20above%20one%20hundred%20thousand.png)
-- information about employees from the HR and Finance department --
SELECT * 
FROM `employees` AS E
JOIN `departments` AS D
ON E.DepartmentID = D.DeptID
where DeptName IN ('Human Resources', 'FINANCE');

![image alt](https://github.com/wakinniranye31/Employee-Management-Project/blob/1983e34d7ac8fb01af3da6b27da9af6955ce14aa/Information%20about%20employees%20from%20the%20HR%20and%20Finance%20department.png)

-- Export records of employees aren’t active --
SELECT *
FROM `employees`
WHERE STATUS != 'Active';

![image alt](https://github.com/wakinniranye31/Employee-Management-Project/blob/c611ca8d3de5bba5afcafdcce19e3deb045ecc66/Export%20records%20of%20employees%20aren%E2%80%99t%20active.png)

-- attendance records of employees who were present in attendance only in Jan 2026 --
select *
from `employees` as E
join `attendance` AS A
ON E.EmployeeID = a.EmployeeID
WHERE AttendanceDate LIKE '2026-01-%';

![image alt](https://github.com/wakinniranye31/Employee-Management-Project/blob/794a017592d735bc57558eaafa67c46d439742df/Attendance%20records%20of%20employees%20who%20were%20present%20in%20attendance%20only%20in%20Jan%202026.png)

-- records of employees from finance department and are still active --
select *
from `employees` as E
JOIN `departments` AS D
ON D.DeptID = E.DepartmentID
WHERE DeptName = 'Finance'
AND Status = 'Active';

![image alt](https://github.com/wakinniranye31/Employee-Management-Project/blob/63ffe3433569dd774a97b46192a4cfc81b5ff23e/Records%20of%20employees%20from%20finance%20department%20and%20are%20still%20active.png)

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

![image alt](https://github.com/wakinniranye31/Employee-Management-Project/blob/509686b464393f947b0558bffb4417a849498212/Phase%205_Next%205%20Employees_Pagination.png)
