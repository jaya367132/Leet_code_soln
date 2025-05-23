# Write your MySQL query statement below
WITH base_table AS (
    SELECT *, 
           RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS ranking
    FROM Products
    WHERE change_date <= '2019-08-16'
)

SELECT A.product_id, 
       ifnull(B.new_price ,10 ) AS price
FROM (SELECT DISTINCT(product_id) FROM Products) A
LEFT JOIN (SELECT * FROM base_table WHERE ranking = 1) B
       ON A.product_id = B.product_id;