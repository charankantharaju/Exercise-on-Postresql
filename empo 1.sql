CREATE TABLE empo(
emp_id INT PRIMARY KEY,
fname VARCHAR(100) NOT NULL,
lname VARCHAR(100) NOT NULL,
emial VARCHAR(100) NOT NULL UNIQUE,
dept VARCHAR(100),
salary DECIMAL(10,2) DEFAULT 30000.00,
hire_date DATE NOT NULL DEFAULT CURRENT_DATE
);
INSERT INTO empo (emp_id, fname, lname, emial, dept, salary, hire_date)
VALUES
(1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15'),
(2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),
(3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),
(4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),
(5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),
(6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),
(7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),
(8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),
(9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),
(10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19');

SELECT * FROM EMPO

-- RELATIONAL AND LOGICAL  0R / AND
SELECT * FROM EMPO
WHERE DEPT = 'HR' OR DEPT = 'IT'

-- DEPT IT AND SALARY MORE THAN 50K 
SELECT * FROM EMPO
WHERE DEPT = 'IT' AND SALARY >= 50000.00

-- DEPT IT AND SALARY MORE LESS 50K 
SELECT * FROM EMPO
WHERE DEPT = 'IT' AND SALARY < 50000.00

-- FIND EMP WHOSE SALARY IS MORE THAN 65000
SELECT * FROM EMPO 
WHERE SALARY > 55000;

-- Retrieve employees hired after January 1, 2020
SELECT * FROM EMPO
WHERE HIRE_DATE > '2020-01-01';

-- List employees from the Marketing department with salary between 50,000 and 60,000:
SELECT * FROM EMPO 
WHERE DEPT = 'Marketing' AND SALARY BETWEEN 50000 AND 60000;

-- Count the number of employees in each department:
SELECT DEPT, COUNT(*)
FROM EMPO 
GROUP BY DEPT;

-- Find the employee with the highest salary
SELECT * FROM EMPO 
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPO );

SELECT MAX(SALARY) FROM EMPO

-- Find employees whose last name starts with 'S':
SELECT * FROM EMPO 
WHERE LNAME LIKE '%a'

-- Calculate the average salary in the IT department:
SELECT AVG(SALARY) FROM EMPO 
WHERE dept = 'IT'

-- Show employees ordered by hire_date descending (most recent first):
SELECT * FROM EMPO 
ORDER BY hire_date DESC;

-- Select employees who have salary NOT between 45000 and 55000
SELECT * FROM EMPO 
WHERE SALARY NOT BETWEEN  45000 AND 55000

-- Find employees with name containing 'a' (case insensitive):
SELECT * FROM EMPO 
WHERE FNAME LIKE '%a' 

-- Retrieve employees with salary greater than the average salary of the company:
SELECT * FROM EMPO 
WHERE SALARY > (SELECT AVG(SALARY)FROM EMPO )

-- find employees from following department like IT, Finance, HR
SELECT * FROM EMPO 
WHERE dept = 'IT'
OR dept ='Finance'
OR dept ='HR'

SELECT * FROM EMPO 
WHERE dept IN ('IT','Finance','HR')

-- find empo whose salary is more than 40k and less than 65k
select * from empo 
where salary between 50000.00 and 65000.00

-- find the different types of department
SELECT DISTINCT DEPT FROM EMPO 

-- arrange name from ascending order 
select * from empo 
order by emp_id desc
limit 5;

-- selecting names which consists i
select * from empo 
where fname like '%i%'

-- selecting names which consists K in starting 
select * from empo 
where fname like 'K%'

-- selecting names which consists a in ending
select * from empo where fname like '%a'

-- select dept which consists of 2 letters 
select * from empo where dept like '__'

-- select the name whoes second letter is a 
select * from empo where fname like '_a%'
                                              
select * from empo where fname like '_a___a%'

-- find avg salary of all dept
select dept,avg(salary) from empo
group by dept

-- group by
select count(emp_id),dept from empo 
group by dept ;

-- Write a query to get the total number of employees in each department.
select dept,count(emp_id) from empo
group by dept ;

-- Average salary of employees grouped by department
select dept, avg(Salary) from empo
group by dept

-- Highest salary earned in each department:
select dept, max(salary) from empo
group by dept 

-- Count of employees hired in each year:
select dept,count(hire_date) from empo 
group by dept  

select extract (year from hire_date) as hire_year, count(*) as emp_hired from empo
group by hire_year
order by hire_year;

-- Count employees hired in each month (group by year and month
select extract (year from hire_date)as hire_year,
		extract (month from hire_date)as hire_month ,
		count (*)as emp_hired from empo
group by hire_year,hire_month
order by hire_year,hire_month;
	
-- string functions 
select concat_ws (' : ',fname,lname) as full_name from empo

-- Departments where average salary is greater than 50,000
select dept, avg(salary) from empo 
group by dept
having avg(salary)> 50000

-- sub sting 
select substring ('hello buddy', 1,6)
select substring ('hello buddy', 6,9)

-- Extract the first 3 characters of the employee's first name from the "empo" table.
select substring (fname, 1,3 ) from empo 

-- Extract the domain name part from the email:
select substring (emial, position ('@' in emial)+1) from empo


-- Extract the last 4 characters from a phone number string (assuming a phone column):
-- select substring (phone , 6,4 ) from empo

-- replace
select fname, replace ('f_name','full_name') from empo

-- altering column names 
alter table empo rename column Full_name to f_name
alter table empo rename column lname to l_name
select * from empo 

-- updating names inside the table 
update empo 
set dept = 'IT_job'
where dept = 'IT'
select*from empo
order by emp_id asc

-- reverse 
select reverse (f_name) from empo

-- length
select length ('hello');

-- find the length of the emp's fname 
select length (f_name) from empo

-- find the length of the emp's whoes fname is greater than 5
select * from empo 
where length(f_name)>5

--Find employees with salary greater than 50000 and display their first name, department, and salary.
select f_name,dept, salary from empo where salary > 50000

-- List employees hired after January 1, 2020.
select * from empo where hire_date > '01-01-2020'


-- Find the average salary of employees in the IT department
select avg(salary) from empo
where dept = 'IT_job'

update empo  
set dept = 'IT'
where dept = 'IT_job'
select * from empo 
order by emp_id asc

-- Count the number of employees in each department.
select dept,count(*) from empo
group by dept;

-- Find employees whose last name starts with 'S'. 
select * from empo 
where f_name like '%a';

-- upper 
select upper (f_name), upper(l_name) from empo

-- lower 
select lower (f_name), upper(l_name) from empo ;

-- Extract the first 4 characters from the string 'hello world' using the LEFT function.
select left ('hello world',4)

-- right 
select right ('hello world', 4)

-- Uppercase first name and last name of all employees.
select upper(f_name), upper(l_name) from empo

-- lowercase first name and uppercase last name of all employees
select lower (f_name),upper(l_name) from empo

-- Find employees whose first name in uppercase starts with 'A'.
select f_name ,l_name 
from empo 
where f_name like 'A%'

-- Display first 3 characters of the last name and convert them to uppercase.
select upper(left(l_name,3))
from empo 

-- Get the last 2 characters of the first name for employees in the IT department.

select f_name,right(f_name,2)
from empo 
where dept = 'IT'

--Find employees whose hire_date year is after 2019 and display their first name in uppercase
select upper(f_name)
from empo 
where extract (year from hire_date)>2019

-- length 
select f_name, length(f_name)from empo

select * from empo 
where length(f_name)>5

-- trim
select length(trim ('    alright'));

--position
select position ('om' in 'thomas')

select email, position ('@' in email) from empo

alter table empo rename column emial to email 

-- exercise 1:raju:sharma:IT
select concat_ws(':',emp_id,f_name,l_name,dept) from empo 
where emp_id = 1;

-- 1:raju sharma:IT:50000
select concat_ws(':',emp_id, concat_ws(' ',f_name,l_name),salary) from empo

select * from empo

--4:suman:FINANCE
select concat_ws(':',f_name,upper(dept)) from empo
where emp_id = 4

-- I1 Raju
select concat(left(dept,1),emp_id, f_name) from empo 
where f_name = 'Raja'
