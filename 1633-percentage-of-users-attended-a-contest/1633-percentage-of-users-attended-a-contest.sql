

select
    contest_id,
    round(
        1.0 * Count(distinct user_id) / (select count(*) from Users ) * 100
         , 2) as percentage
from 
    Register r
group by
    contest_id 
order by
    percentage desc,
    contest_id 