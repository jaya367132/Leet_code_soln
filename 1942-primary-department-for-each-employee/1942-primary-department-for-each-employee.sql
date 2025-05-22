# Write your MySQL query statement below
select employee_id , department_id 
from Employee 
where primary_flag = "Y" or 
      employee_id IN (
       SELECT employee_id
       FROM Employee
       GROUP BY employee_id
       HAVING COUNT(*) = 1
   );
 