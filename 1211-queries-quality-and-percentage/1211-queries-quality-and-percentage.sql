

select 
    query_name,
    round( sum(1.0* rating / position) / count(query_name), 2) as quality ,
     round(1.0 * count(
     case
     when  rating < 3 then 1 end ) / count(rating) * 100, 2) as poor_query_percentage
from 
    Queries 
group by 
    query_name 
order by 
    query_name desc