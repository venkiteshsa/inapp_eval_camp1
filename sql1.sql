--Question 1

CREATE TABLE department(
	dept_no INT PRIMARY KEY,
	dept_name VARCHAR(20),
)

CREATE TABLE employee(
	emp_id INT PRIMARY KEY,
	emp_name VARCHAR(25),
)

CREATE TABLE pay(
	emp_id INT,
	pay INT
)

CREATE TABLE id(
	emp_id INT,
	dept_no INT,
	dept_name VARCHAR(20)
)

INSERT INTO department VALUES
(01, 'IT'),
(02, 'Sales'),
(03, 'Marketing'),
(04, 'HR')

INSERT INTO employee VALUES
(001, 'Dilip'),
(002, 'Fahad'),
(003, 'Lal'),
(004, 'Nivin'),
(005, 'Vijay'),
(006, 'Anu'),
(007, 'Nimisha'),
(008, 'Praveena')

INSERT INTO pay VALUES
(001, 3000),
(002, 4000),
(003, 6000),
(004, 2000),
(005, 9000),
(006, 5000),
(007, 5000),
(008, 8000)

INSERT INTO id VALUES
(001, 01, 'IT'),
(002, 02, 'Sales'),
(003, 03, 'Marketing'),
(004, 01, 'IT'),
(005, 02, 'Sales'),
(006, 04, 'HR'),
(007, 02, 'Sales'),
(008, 03, 'Marketing')

--1) The total number of employees
SELECT COUNT(*) AS Total_no FROM employee

--2) Total amount required to pay all employees
SELECT SUM(pay) AS Total_amount FROM pay

--3) Average, minimum and maximum pay in the organization
SELECT AVG(pay) AS Average, MIN(pay) AS Minimum, MAX(pay) AS Maximum FROM pay

--4) Each Department wise total pay
SELECT id.dept_name, SUM(pay.pay) AS Total_pay
FROM id
INNER JOIN pay ON pay.emp_id = id.emp_id
GROUP BY id.dept_name

--5) Average, minimum and maximum pay department-wise
SELECT id.dept_name, AVG(pay.pay) AS Average, MAX(pay.pay) AS Maximum, MIN(pay.pay) AS Minimum
FROM id
INNER JOIN pay ON pay.emp_id = id.emp_id
GROUP BY id.dept_name

--6) Employee details who earns the maximum pay
SELECT employee.emp_id, employee.emp_name, pay.pay, id.dept_name
FROM employee
INNER JOIN pay ON pay.emp_id = employee.emp_id
INNER JOIN id ON id.emp_id = employee.emp_id
WHERE pay.pay = (SELECT MAX(pay) FROM pay)

--@@7) Employee details who is having a maximum pay in the department
SELECT employee.emp_id, employee.emp_name, pay.pay, id.dept_name
FROM employee
INNER JOIN pay ON pay.emp_id = employee.emp_id
INNER JOIN id ON id.emp_id = employee.emp_id
WHERE pay.pay = (SELECT MAX(pay) FROM pay)

--@@8) Employee who has more pay than the average pay of his department
SELECT employee.emp_name
FROM employee
INNER JOIN pay ON pay.emp_id = employee.emp_id
INNER JOIN id ON id.emp_id = employee.emp_id
WHERE pay.pay > (SELECT AVG(pay) FROM pay)
GROUP BY id.dept_name
--ORDER BY employee.emp_name

--9)Unique departments in the company
SELECT DISTINCT(id.dept_name) FROM id

--10)Employees In increasing order of pay
SELECT employee.emp_id, employee.emp_name, pay.pay, id.dept_name
FROM employee
INNER JOIN pay ON pay.emp_id = employee.emp_id
INNER JOIN id ON id.emp_id = employee.emp_id
ORDER BY pay.pay

--11)Department In increasing order of paySELECT id.dept_name
FROM id
INNER JOIN pay ON pay.emp_id = id.emp_id
INNER JOIN department ON department.dept_no = id.dept_no
GROUP BY id.dept_name
ORDER BY SUM(pay.pay)