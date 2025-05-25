# Write your MySQL query statement below
select e1.name from Employee e1
join 
(SELECT ManagerId 
	FROM Employee
	GROUP BY ManagerId
	HAVING COUNT(ManagerId) >= 5) e2
on e1.id = e2.managerId 


