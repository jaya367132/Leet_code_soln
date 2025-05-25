# Write your MySQL query statement below
select Department , name as Employee , salary 
from (
select e.* ,d.name as Department ,
DENSE_RANK() OVER (
            PARTITION BY e.departmentId 
            ORDER BY e.salary DESC
        ) AS rnk
from Employee e
left join Department d
on d.id = e.departmentId )
AS ranked
WHERE rnk <= 3;
