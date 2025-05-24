WITH cte AS (
  SELECT r.user_id, r.movie_id, r.rating, r.created_at, u.name, m.title 
  FROM MovieRating r
  LEFT JOIN Users u ON u.user_id = r.user_id
  LEFT JOIN Movies m ON m.movie_id = r.movie_id
),
cte2 AS (
  SELECT 
    cte.name AS results, 
    COUNT(*) AS rating_count
  FROM cte
  GROUP BY cte.user_id, cte.name
  ORDER BY rating_count DESC ,cte.name 
  LIMIT 1
),

ct3 as (
select avg(rating) ,cte.title AS results
from cte
WHERE DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
GROUP BY  cte.title
ORDER BY avg(rating) desc ,title asc 
limit 1)

select results from cte2 
union all
select results from ct3



