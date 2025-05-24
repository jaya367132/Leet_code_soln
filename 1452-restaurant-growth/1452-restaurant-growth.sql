# Write your MySQL query statement below
with daily_amount as
(select visited_on , 
sum(amount)  as amount
from Customer
group by visited_on ),

moving_avg AS 
(
select visited_on ,
        sum(amount) over(order by visited_on rows between 6 preceding and CURRENT row ) 
        as  amount ,
        ROUND(avg(amount) 
        over(order by visited_on rows between 6 preceding and CURRENT row ),2) 
        as average_amount,
    COUNT(*) OVER (
      ORDER BY visited_on 
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS days_count
  FROM daily_amount
)   

SELECT 
  visited_on, 
  amount, 
  average_amount
FROM moving_avg
WHERE days_count = 7
ORDER BY visited_on;


