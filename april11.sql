---------------------------------------------------module 2---------------------------------------------------------------
create database april11


--1.Create a customer table which comprises of these columns – ‘customer_id’, ‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
create table customer(customer_id int,first_name varchar(40),last_name varchar(40),email varchar(40),address varchar(40),
city varchar(30),state varchar(30),zip int)

--2.Insert 5 new records into the table
insert into customer values(10,'Sanjay','Satyapal','ss@gmail.com','tower8','Pune','Maharashtra',410072)
insert into customer values(20,'manjula','malapati','manjula@gmail.com','tower9','chennai','tamilnadu',410873)
insert into customer values(30,'george','yuss','gg@gmail.com','kingstown','sanjose','california',100987)
insert into customer values(40,'ravindra','yadav','rr@gmail.com','tower7','bangalore','karnataka',570072)
insert into customer values(50,'Sara','Soni','soo@gmail.com','tower5','merut','uttarpradesh',419972)

select * from customer

--3.Select only the ‘first_name’ & ‘last_name’ columns from the customer table
select first_name,last_name from customer

--4.Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’
select * from customer where first_name like 'g%' and city like 'sanjose'
select * from customer where first_name like 'g%' and city= 'sanjose'

--------------------------------------------------module 3-----------------------------------------------------------------------
---1.Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’, ‘customer_id’
create table order1(order_id int,order_date date,amount int,customer_id int)
insert into order1 values(101,'2022/08/13',1500,10),
(102,'2022/07/08',6000,20),
(103,'2023/02/13',5400,80),
(104,'2023/06/23',1800,40),
(105,'2022/07/05',2300,70)

--2.Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column 
select * from order1 o inner join
customer c on o.customer_id=c.customer_id


--3.Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column
---left join:displays all the matching rows from both the table plus non matching row from left table
--right join:displays all the matching rows from both table plus non matching row from right table
select * from order1 o left join
customer c on o.customer_id=c.customer_id

select * from order1 o right join
customer c on o.customer_id=c.customer_id


---4.Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 20

update order1 set amount=100 where customer_id=20

WITH Sales_CTE (SalesPersonID, TotalSales, SalesYear)
AS
-- Define the first CTE query.
(
    SELECT SalesPersonID, SUM(TotalDue) AS TotalSales, YEAR(OrderDate) AS SalesYear
    FROM Sales.SalesOrderHeader
    WHERE SalesPersonID IS NOT NULL
       GROUP BY SalesPersonID, YEAR(OrderDate)

)
, -- Use a comma to separate multiple CTE definitions.

-- Define the second CTE query, which returns sales quota data by year for each sales person.
Sales_Quota_CTE (BusinessEntityID, SalesQuota, SalesQuotaYear)
AS
(
       SELECT BusinessEntityID, SUM(SalesQuota)AS SalesQuota, YEAR(QuotaDate) AS SalesQuotaYear
       FROM Sales.SalesPersonQuotaHistory
       GROUP BY BusinessEntityID, YEAR(QuotaDate)
)

-- Define the outer query by referencing columns from both CTEs.
SELECT SalesPersonID
  , SalesYear
  , FORMAT(TotalSales,'C','en-us') AS TotalSales
  , SalesQuotaYear
  , FORMAT (SalesQuota,'C','en-us') AS SalesQuota
  , FORMAT (TotalSales -SalesQuota, 'C','en-us') AS Amt_Above_or_Below_Quota
FROM Sales_CTE
JOIN Sales_Quota_CTE ON Sales_Quota_CTE.BusinessEntityID = Sales_CTE.SalesPersonID
                    AND Sales_CTE.SalesYear = Sales_Quota_CTE.SalesQuotaYear
ORDER BY SalesPersonID, SalesYear;

