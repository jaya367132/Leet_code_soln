# Write your MySQL query statement below
select class 
from (select class , count(distinct(student))  as num,student from Courses group by class) x
where num >= 5 

#select `class` from `courses` group by `class` having count(distinct `student`) >= 5
