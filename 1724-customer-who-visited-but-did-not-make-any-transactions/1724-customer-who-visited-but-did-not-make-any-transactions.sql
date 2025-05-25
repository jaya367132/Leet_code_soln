# Write your MySQL query statement below
select count(v.visit_id)  as count_no_trans ,
v.customer_id from Visits v
left join Transactions t
on t.visit_id = v.visit_id 
where t.transaction_id is null 
GROUP BY
    v.customer_id;
