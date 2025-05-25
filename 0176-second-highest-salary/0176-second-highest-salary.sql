# Write your MySQL query statement below
SELECT 
  IFNULL((
    SELECT salary 
    FROM (
      SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk 
      FROM Employee
    ) ranked
    WHERE rnk = 2
    LIMIT 1
  ), NULL) AS SecondHighestSalary;