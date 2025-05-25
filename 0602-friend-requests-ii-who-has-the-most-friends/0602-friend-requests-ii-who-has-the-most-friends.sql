# Write your MySQL query statement below
 select person as id , count(friend) as num
 from
(SELECT requester_id AS person, accepter_id AS friend FROM RequestAccepted
    UNION ALL
SELECT accepter_id AS person, requester_id AS friend FROM RequestAccepted ) x
group by person
ORDER BY num DESC
LIMIT 1;