# Write your MySQL query statement below
#lets make col for with Satrttime  and end time 
select machine_id , round(avg(end_timestamp-start_timestamp ),3) as processing_time 
from 
    (select    
        machine_id , process_id  ,
        max(case when activity_type = "start" THEN timestamp end ) as start_timestamp,
        max(case when activity_type = "end" THEN timestamp end ) as end_timestamp 
    from Activity 
    group by machine_id  , process_id ) AS process_times 
    GROUP BY machine_id; 
    