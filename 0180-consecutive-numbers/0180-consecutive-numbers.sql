# Write your MySQL query statement below
select DISTINCT(num) as ConsecutiveNums
from (SELECT *,
           LAG(num, 1) OVER (ORDER BY id) AS prev1,
           LAG(num, 2) OVER (ORDER BY id) AS prev2
    FROM Logs) l
where num = prev1 and num = prev2 ;