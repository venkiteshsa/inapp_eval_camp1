CREATE TABLE Employee3(
	EMPNO INT PRIMARY KEY,
	ENAME VARCHAR(20),
	JOB VARCHAR(20),
	MGR INT,
	HIREDATE DATE,
	SAL INT,
	COMMISSION INT,
	DEPTNO INT,
)

CREATE TABLE DEPT(
	DEPTNO INT,
	DNAME VARCHAR(20),
	LOC VARCHAR(20)
)

INSERT INTO Employee3 VALUES
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782,' CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7788, 'SCOTT', 'ANALYST', 7566, '12-09-1982', 3000, NULL,20),
(7902, 'FORD', 'ANALYST', 7566, '12-03-1981', 3000, NULL,20),
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL,20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300 ,30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500 ,30),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400 ,30),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, NULL,30),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL,20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL,30),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL,10)

INSERT INTO DEPT VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON')--1. Report needed: Names of employees who are manager.

SELECT ENAME FROM Employee3 WHERE MGR = 7839

--2. List the name of all employees along with their department name and Annual
--Income.
--For each row get the output in the form ‘Every Year Mark of Accounts department
--earns amount 450000’. This output has to come under a heading ‘Annual income
--Report’.SELECT CONCAT('Every year ', ENAME, ' of ', DEPT.DNAME, ' department earns amount ', SAL) AS 'Annual Income Report' FROM Employee3INNER JOIN DEPT ON DEPT.DEPTNO = Employee3.DEPTNO--3. Report needed: Names of departments and names of employees. Names of departments
--in ascending order. Within the same department, employee name should be in the
--descending orderSELECT DEPT.DNAME, Employee3.ENAME FROM Employee3INNER JOIN DEPT ON DEPT.DEPTNO = Employee3.DEPTNOORDER BY DEPT.DNAME , Employee3.ENAME DESC--@@4. Find out employee name and departmentname of employees who either works in a Toy
--or Shoe department.SELECT Employee3.ENAME, DEPT.DNAME FROM Employee3 INNER JOIN DEPT ON DEPT.DEPTNO = Employee3.DEPTNO--5. Report needed: Name concatenated with department, separated by comma and space
--and name column Employee and departmentSELECT CONCAT(ENAME, ', ', DEPT.DNAME) AS 'Employee and Department' FROM Employee3INNER JOIN DEPT ON DEPT.DEPTNO = Employee3.DEPTNO--6. Write a query to display name, job, department number and department name for
--all employees who work in DALLAS.SELECT ENAME, JOB, Employee3.DEPTNO, DEPT.DNAME FROM Employee3INNER JOIN DEPT ON DEPT.DEPTNO = Employee3.DEPTNOWHERE Employee3.DEPTNO = 20--7. List the names of all employees along with name of managersSELECT E1.ENAME AS Employee, E2.ENAME AS Manager FROM Employee3 E1, Employee3 E2WHERE E1.MGR = E2.EMPNO--8. Display all employee name, manager number and manager name of all employees
--including King who have no managerSELECT E1.ENAME AS Employee, E2.ENAME AS Manager FROM Employee3 E1LEFT JOIN Employee3 AS E2 ON E1.MGR = E2.EMPNO--9. Display employee name, department number and all employees that work in same
--department as a given employee (‘Mathew’). Give each column an appropriate labelSELECT ENAME, DEPTNOFROM Employee3WHERE DEPTNO = (SELECT DEPTNO FROM Employee3 WHERE ENAME = 'Mathew') --10. Create a unique listing of all jobs that are in department 30. Include location
--of department 30 in the output.SELECT DISTINCT JOB, DEPT.LOC FROM Employee3INNER JOIN DEPT ON DEPT.DEPTNO = Employee3.DEPTNOWHERE DEPT.DEPTNO = 30