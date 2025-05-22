# Write your MySQL query statement below
-- select Date_format(trans_date,"%y-%m") as month ,
--        country ,
--        count(id) as trans_count ,
--        sum(if(state='approved',1,0)) as approved_count ,
--        sum(amount) as trans_total_amount ,
--        sum(if(state ="approved",amount,0)) as approved_total_amount
-- from Transactions
-- group by Date_format(trans_date,"%y-%m") , country ;

SELECT
Date_format(trans_date, '%Y-%m') AS month,
country AS country,
count(id) AS trans_count,
SUM(case WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(case WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM
transactions
GROUP BY
Date_format(trans_date, '%Y-%m') ,
country;
