# Write your MySQL query statement below
with cte as 
(select o.* , p.product_name from Orders o 
left join Products p 
using(product_id)
where o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01')

select product_name , sum(unit) as unit from cte 
group by product_id 
HAVING SUM(unit) >= 100
