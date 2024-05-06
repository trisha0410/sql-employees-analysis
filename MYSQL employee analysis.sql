CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY ,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        select * from worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
 --Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>
 
select FIRST_NAME as WORKER_NAME

from worker;

--Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

select UPPER(FIRST_NAME) as WORKER_NAME
from worker;

--Write an SQL query to fetch unique values of DEPARTMENT from Worker table

select DISTINCT FIRST_NAME
from worker;

--Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

 SELECT * FROM Worker ORDER BY FIRST_NAME ASC;

--Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending

SELECT * FROM WORKER
 ORDER BY FIRST_NAME ASC ,
 DEPARTMENT DESC;

--Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker
where FIRST_NAME = 'Vipul' OR  FIRST_NAME ='Satish';

--Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ('Vipul','Satish');

-- Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from worker where DEPARTMENT ='Admin';

--Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT *
FROM Worker
WHERE 
  FIRST_NAME LIKE '%a%';
  
  --Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
  select * FROM WORKER WHERE FIRST_NAME LIKE '%a';
  
  --Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
  select * from worker 
  where FIRST_NAME LIKE '%h'
        and length(FIRST_NAME)=6;
        
 --Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
 select * from worker where SALARY between 100000 and 500000;
 
 --Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WORKER WHERE YEAR(JOINING_DATE)=2014 AND MONTH(JOINING_DATE)=02;

--Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(DEPARTMENT) FROM Worker WHERE DEPARTMENT = 'ADMIN';

--Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select FIRST_NAME FROM WORKER WHERE SALARY BETWEEN 50000 and 100000;

--Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS NO_OF_WORKERS FROM Worker GROUP BY DEPARTMENT 
        ORDER BY COUNT(DEPARTMENT) DESC;
        
--Write an SQL query to print details of the Workers who are also Managers.


--Write an SQL query to fetch the departments that have less than five people in it.
select DEPARTMENT from Worker
inner join Title 
on WORKER_ID=WORKER_REF_ID
group by Worker.DEPARTMENT
having count(*)<5;

--Write an SQL query to fetch the list of employees with the same salary.
  SELECT SALARY, COUNT(SALARY)  
FROM Worker
GROUP BY SALARY  
HAVING COUNT(SALARY) > 1;  

--Write an SQL query to show the second highest salary from a table.
SELECT SALARY 
FROM Worker 
ORDER BY SALARY desc limit 1,1;

--Write an SQL query to fetch the first 50% records from a table
select from worker
limit (count(*)/2 from worker );

--Write an SQL query to fetch the departments that have less than five people in it.
select DEPARTMENT from Worker 
inner join Title
on WORKER_ID=WORKER_REF_ID
group by Worker.DEPARTMENT
having count(*)<5;

--Write an SQL query to show all departments along with the number of people in there.
select DEPARTMENT ,COUNT(*)
FROM Worker 
GROUP BY  DEPARTMENT;

--Write an SQL query to show the last record from a table.
SELECT * FROM Worker 
order by WORKER_ID desc limit 1;

--Write an SQL query to fetch the first row of a table
select * from Worker
limit 1;