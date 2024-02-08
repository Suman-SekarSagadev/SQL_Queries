use intellipaat

select* from sumana

ALTER TABLE dbo.SUMANA 
ADD HIRE_DATE VARCHAR(20) NULL, REL_DATE INT NULL ;

ALTER TABLE DBO.SUMANA
drop column_b

ALTER TABLE dbo. sumana DROP COLUMN column_c;

update sumana
set HIRE_DATE ='2023-05-17'

ALTER TABLE DBO.SUMANA DROP COLUMN REL_DATE ;
SELECT * FROM SUMANA

UPDATE SUMANA
SET HIRE_DATE ='2023-05-19'
WHERE INSTITUTE ='BDPS'


SELECT * FROM SUMANA

ALTER TABLE SUMANA ADD REAL_DATE
VARCHAR(20);

UPDATE SUMANA
SET REAL_DATE  ='2023-07-10'

UPDATE SUMANA
SET REAL_DATE ='2023-05-19'
WHERE COURSE ='DCA'

SELECT * FROM SUMANA

ALTER TABLE SUMANA 
ADD SALARY INT;

UPDATE SUMANA 
SET SALARY ='45000'
WHERE INSTITUTE ='COIT'

UPDATE SUMANA
SET SALARY ='20000'
WHERE INSTITUTE = 'COIT'

ALTER TABLE dbo. SUMANA DROP COLUMN REAL_DATE;

SELECT * FROM SUMANA

## ADD_COLUMN
ALTER TABLE SUMANA ADD
UNIVERSITY VARCHAR(20);

## NAME_UPDATE

UPDATE SUMANA
SET UNIVERSITY ='SRM'

## NAME_PARTTICLUR

UPDATE SUMANA
SET UNIVERSITY ='SASTHA'
WHERE INSTITUTE ='SABHARI'

SELECT * FROM SUMANA

## DROP_COLUMN

ALTER TABLE SUMANA DROP COLUMN HIRE_DATE

alter table sumana
add hire_date varchar(15)

update sumana
set hire_date ='2023-03-31'
where university ='SRM'

select * from sumana

select max(salary) 
from sumana

select max(salary)
from sumana
where salary >(select avg(salary) from sumana)

update sumana
set salary ='9000'
where course ='mca'

alter table sumana drop column university;

select avg(salary) 
from sumana --- 20000 avg salary

select *
from sumana
where salary >(select avg(salary) 
from sumana)

select avg(salary)
from sumana

create table employee
(
emp_id int , empl_name varchar(15), posting varchar(10))

insert into employee values
(2,'dinesh','BE'),
(3,'sumanji','BA')

select * from employee
left join emp

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
select * from software

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


select * from studies
select * from software

select avg(s.course_fee) , sum(ss.sold),
dense_rank() over (partition by s.institute order by s.course_fee desc),
rank() over (order by s.course_fee desc)
from studies s
left join software ss
on s.pname=ss.pname
order by s.course_fee

select current_timestamp as current_times
select datename (month,(current_timestamp))
select CURRENT_TIMESTAMP

select dateadd(day,-2,CURRENT_TIMESTAMP)
use April_14
select *
from dbo.vendor_payout_may

delete vendor_payout_may

use intellipaat

select* from sumana

alter table sumana add basi_salary int

select* from sumana

alter table sumana drop column basi_salary
alter table sumana drop column field
alter table sumana drop column Current_status

update sumana
set Old_salary ='19000'
where Course ='HDCA'

select avg(salary)
from sumana

select *
from sumana
where Salary>(select avg(salary) from sumana)

with cte as (select pname , course ,avg(salary)
from sumana),
cte2 as (select pname , course , max(salary)
from sumana),
cte3 as (select pname , course , min(salary)
from sumana)

USE intellipaat

select* from sumana
update sumana 
set New_salary='9500'
where course ='MCA'

alter table sumana drop column Old_salary

select * from sumana

select avg(salary)
from sumana

select*
from sumana
where salary>(select avg(salary)from sumana)

create table priya (
Eid int , ename varchar(20) , salary int , roles varchar(15) ,old_salary int
)

insert into priya values(
1,'suman',10000,'SBA',5000)

insert into priya values(
2, 'priya', 20000,'Teacher',2300)

insert into priya values(
3,'jashwika',50000,'Doctor',40000),

insert into priya values(
4,'sara',34000,'AC',1200)

select* from priya
update priya
set old_salary='10000'
where ename='suman'

select* from priya

select current_timestamp as current_times
select datename (month,(current_timestamp))
select CURRENT_TIMESTAMP

select dateadd(day,-2,CURRENT_TIMESTAMP)

select CURRENT_TIMESTAMP as curent_time
select DATEADD(day,-2, current_timestamp)

select * from April_14

with cte_numbers (n , weekday)
as (select 0, datename(dw,0)
union all select n+1 ,
datename (dw, n+1 )
from cte_numbers
where  n< 6)
select weekday from cte_numbers

with cn ( n , weekday)
as (select 0 , datename (dw ,0)
union all select n+1 ,
datename (dw , n+1)
from cn
where n < 6)
select weekday from cn

SELECT * FROM My_Schema.Tables;
CREATE TABLE computer (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

INSERT INTO computer values
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

select * from computer

alter table computer drop computer
drop table computer


SELECT * FROM computer.Tables;
SELECT * FROM My_Schema.computer;

select avg(sold) as avg_cost
from computer

select * from computer
with cte as(
select pname ,developin , sum(scost) as scost, sum(dcost) as dcost , avg(scost / dcost) as avg_costt
from computer 
where sold > (select avg(sold) as avg_cost from computer)
group by pname ,developin ),
cte2 (
select pname , avg_costt
from cte)
cte3 (select pname , scost
from cte)
select pname , scost , dcost , avg_costt
from cte , cte2 , cte3
