use intellipaat

select * from sumana

update sumana
set hire_date='2023-05-05'
where course ='MCA'

alter table sumana add Relieving_date varchar(20)

update sumana 
set Relieving_date ='Relived'
where course ='DAP'

select avg(salary) from sumana

with cte as (select *,
case
when course_fee >= 10000 then 'very high'
when course_fee >= 7000 then 'Moderate'
when course_fee <= 5000 then 'Normal'
end as course_structure 
from sumana),
with cte1 as (select *, salary-course_fee ,
DENSE_RANK() over (order by course_fee desc) as Ranke
from cte
where salary >=2000
and course = 'DCA'
order by course_fee)
select *
from cte1

with sal as (select sum(course_fee) as total_course_fee
from sumana
where institute = 'Sabhari'),
sala as (select  sum(salary) as total_salary_earn
from sumana
where institute ='sabhari'),

sales_vs_salary as (select round(sum(course_fee*salary)/course_fee,2)*100 as sales_vs_sala
from sumana
group by course_fee , salary)

select  total_course_fee , total_salary_earn , sales_vs_sala
from sal , sala , sales_vs_salary

select * from sumana

WITH sumary_sales AS ( 
    SELECT
        sum(sales_num*sales_price) sum_sales_revenue,
        sales_item_id 
    FROM sales 
    GROUP BY sales_item_id
    ORDER BY sum_sales_revenue
    ),
customers_sales AS (
    SELECT
      sales_customer_id,
      round(sum(sales_num*sales_price)/sum_sales_revenue,2)*100 sales_perchent,
      sumary_sales.sales_item_id
    FROM sales
    JOIN sumary_sales
    ON sumary_sales.sales_item_Id = sales.sales_item_id
    GROUP BY sales_customer_id, sumary_sales.sales_item_id, sum_sales_revenue
    )
 
SELECT
    customer_name,
    sales_perchent,
    items.item_name
FROM customers_sales
JOIN customers
ON customers.id = sales_customer_id
JOIN items
ON items.id = sales_item_id
ORDER BY item_name