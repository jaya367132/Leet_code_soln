# Write your MySQL query statement below
-- select if(person_name 
-- from (select *, sum(weight) over(order by turn) as running_total
-- from queue ) rt
-- where running_total >=1000 
-- limit 1
# Write your MySQL query statement below
SELECT PERSON_NAME FROM (
SELECT
PERSON_NAME,TURN,
SUM(WEIGHT) OVER(ORDER BY TURN) CUM_SUM
FROM QUEUE) TAB
WHERE CUM_SUM<=1000
ORDER BY TURN DESC
LIMIT 1