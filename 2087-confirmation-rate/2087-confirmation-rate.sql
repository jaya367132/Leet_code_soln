# Write your MySQL query statement below
with cte as(
select user_id ,
       sum(if (action = "confirmed" , 1,0))/count(*) as confirmation_rate 
from Confirmations
group by user_id )

select s.user_id ,
       round(if ( confirmation_rate is null , 0 , confirmation_rate ),2) as confirmation_rate
from Signups s
left join cte c
on s.user_id = c.user_id
order by confirmation_rate 
       
