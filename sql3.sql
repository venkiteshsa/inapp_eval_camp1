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
(40, 'OPERATIONS', 'BOSTON')

SELECT ENAME FROM Employee3 WHERE MGR = 7839

--2. List the name of all employees along with their department name and Annual
--Income.
--For each row get the output in the form �Every Year Mark of Accounts department
--earns amount 450000�. This output has to come under a heading �Annual income
--Report�.
--in ascending order. Within the same department, employee name should be in the
--descending order
--or Shoe department.
--and name column Employee and department
--all employees who work in DALLAS.
--including King who have no manager
--department as a given employee (�Mathew�). Give each column an appropriate label
--of department 30 in the output.