create database Intel_Assgn

use Intel_Assgn

CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )

INSERT INTO studies values
('ANAND','SABHARI','PGDCA',4500 ),
('ALTAF','COIT','DCA',7200 ),
('JULIANA','BDPS','MCA',22000 ),
('KAMALA','PRAGATHI','DCA',5000 ),
('MARY','SABHARI','PGDCA ',4500 ),
('NELSON','PRAGATHI','DAP',6200 ),
('PATRICK','PRAGATHI','DCAP',5200 ),
('QADIR','APPLE','HDCA',14000 ),
('RAMESH','SABHARI','PGDCA',4500 ),
('REBECCA','BRILLIANT','DCAP',11000 ),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000 ),
('VIJAYA','BDPS','DCA',48000);

select * from studies

CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

INSERT INTO software values
('MARY','README','CPP',300, 1200, 84), 
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43 ),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 ),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0 ),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4), 
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 ),
('QADIR','VACCINES','C',1900, 3100, 21 ),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
('REMITHA','PC UTILITIES','C',725, 5000, 51 ),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
('VIJAYA','TSR EDITOR','C',900, 700, 6);
use intelippat
select * from software

CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)

INSERT INTO programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 ),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 ),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 ),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 ),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 ),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 ),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 ),
( 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 ),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 ),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 ),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 ),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 ),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);

select * from programmer

-----1.Find out the selling cost AVG for packages developed in Pascal.
select avg(SCOST) FROM software where DEVELOPIN='Pascal'

----2. Display Names, Ages of all Programmers.
select pname,year(getdate())-year(DOB) as age from programmer

select pname as name,DATEDIFF(YY,DOB,GETDATE()) AS AGE FROM programmer

---3. Display the Names of those who have done the DAP Course.
SELECT pname,course from studies where course='DAP'

---4. Display the Names and Date of Births of all Programmers Born in January.
select pname as Names, dob from programmer where datename(mm,dob)='January'

select pname as name,DOB FROM programmer WHERE month(DOB)=1

---5. What is the Highest Number of copies sold by a Package?
SELECT MAX(SOLD) AS HIGHEST_SOLD FROM software

---6. Display lowest course Fee.
SELECT MIN(COURSE_FEE) AS LOWEST_FEE FROM studies

---7. How many programmers done the PGDCA Course?
SELECT COUNT(PNAME) FROM STUDIES WHERE COURSE='PGDCA'

---8. How much revenue has been earned thru sales of Packages Developed in C.
SELECT SUM(SCOST*SOLD) FROM SOFTWARE WHERE DEVELOPIN='C'

---9. Display the Details of the Software Developed by Ramesh.
SELECT * FROM software where PNAME='Ramesh'

---10. How many Programmers Studied at Sabhari?
select COUNT(*) as 'Programmers Studied In Sabhari' From Studies where INSTITUTE='SABHARI'

select count(1) from studies where INSTITUTE='sabhari'
--11. Display details of Packages whose sales crossed the 2000 Mark.
Select title from software where scost*sold>2000
select * from software where (scost*sold)>2000

select title, SUM(Scost*sold) as total_revenue from software group by TITLE having sum(scost*sold)>2000

---12. Display the Details of Packages for which Development Cost have been recovered
select * from software where (scost*sold)>DCOST

---13.What is the cost of the costliest software development in Basic?
select title, max(scost) from software where developin='Basic' group by title

---14. How many Packages Developed in DBASE?
Select title,count(title) from software where developin='DBASE' group by TITLE

select count(1) from software where developin='dbase'

---15. How many programmers studied in Pragathi?
select COUNT(*) as 'Programmer Studied In Pragathi' From Studies where INSTITUTE='PRAGATHI'

select count(pname) from studies where institute='pragathi'

select count(1) from studies where institute='pragathi'

---16. How many Programmers Paid 5000 to 10000 for their course?
select count(1) from studies where course_fee between 5000 and 10000

---17. What is AVG Course Fee
select avg(course_fee) from studies

---18. Display the details of the Programmers Knowing C.
select * From Programmer where PROF1='C' or PROF2='C'

Select * from programmer where 'C' in(Prof1,Prof2)

---19. How many Programmers know either COBOL or PASCAL.
select count(1) from programmer where prof1='cobol' or prof1='pascal' or prof2='cobol' or prof2='pascal'

---20. How many Programmers Don’t know PASCAL and C
select * from programmer where 'pascal' not in(prof1,prof2) and 'c' not in(prof1,prof2)

---21. How old is the Oldest Male Programmer.
select max(datediff(yy,dob,getdate())) from programmer where gender='M'

---22. What is the AVG age of Female Programmers?
select avg(datediff(yy,dob,getdate())) from programmer where gender='F'

---23. Calculate the Experience in Years for each Programmer and Display with theirnames in Descending order.
select pname,datediff(yy,DOJ,getdate()) as experience from programmer order by experience desc

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month?
select pname from programmer where month(DOB)=month(getdate())

---25. How many Female Programmers are there?
select COUNT(*) as 'Female Programmer' From Programmer where GENDER='F'

--26. What are the Languages studied by Male Programmers.
select pname,prof1,prof2 from programmer where gender='M'

---27. What is the AVG Salary?
select avg(salary) from programmer

---28. How many people draw salary 2000 to 4000?
select count(1) from programmer where salary between 2000 and 4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL.
select * from programmer where 'clipper' not in (prof1,prof2) and 'cobol' not in (prof1,prof2) and 'pascal' not in (prof1,prof2)

---30. Display the Cost of Package Developed By each Programmer
select pname,sum(Dcost) from software group by PNAME

use intellipaat

select *
from sumana

select avg(course_fee) as avg_fees
from sumana

select *
from sumana
where COURSE_FEE > (select avg(course_fee) as avg_fees
from sumana)


use intellipaat

select * from software

alter table software 
add emp_id int

update software
set completed = 5
where DEVELOPIN = 'PASCAL'

alter table software add completed int
alter table software add canceled int
alter table software drop column canceled

select
count(emp_id) filter(where completed = 4) as com,
count(emp_id) filter(where completed = 5) as can,
count(emp_id) as total,
count(emp_id) filter(where completed=4)*100/count(emp_id) as FF
from software


select
count(emp_id) filter(where completed = 4) as com
from software

create procedure mapss(pname varchar(10), title varchar(20), developin varchar(20), scost , integer , dcost integer , sold integer)
language 'mssql'
as $$
begin
insert into software values(pname ,title ,developin,scost ,dcost,sold);
commit;
end;
$$
select
case
when total_id >100 then 'Highest'
when total_id <100 then 'poor'
end as 'moderated'
count(total_id)filter(where locals=1)as commends,
count(total_id)filter(where locals=2)as disconnet,
count(total_id)as totals,
count(total_id)filter(where locals=1)*100/count(total_id)as Fulfill
and date(to_timestamp(pickup)+interval '5.5 hours')>='2023-09-10'
and date(to_timestamp(pickup)+ interval '5.5 hours')<='2023-09-19'

use intellipaat

select * from software
UNION ALL
select * from studies;

select avg(dcost)as avg_salary
from software

select *
from software
where dcost >(select avg(dcost)as avg_salary
from software

alter table software add ranker int

update software 
set ranker ='9'
where completed = 4

select ranker ,sum(dcost) as total_earn,
case
when ranker >9 then 'Highest'
when ranker <=9 then 'poor'
end as 'model'
from software
group by ranker


