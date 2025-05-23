# Write your MySQL query statement below
SELECT person_name 
FROM (
  SELECT *, 
         SUM(weight) OVER(ORDER BY turn) AS running_total
  FROM queue
) rt
WHERE running_total <= 1000 
ORDER BY TURN DESC
LIMIT 1;
# Write your MySQL query statement below
-- SELECT PERSON_NAME FROM (
-- SELECT
-- PERSON_NAME,TURN,
-- SUM(WEIGHT) OVER(ORDER BY TURN) CUM_SUM
-- FROM QUEUE) TAB
-- WHERE CUM_SUM<=1000
-- ORDER BY TURN DESC
-- LIMIT 1