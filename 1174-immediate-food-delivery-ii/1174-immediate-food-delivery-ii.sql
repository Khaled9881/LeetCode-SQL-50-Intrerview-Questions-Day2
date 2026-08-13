/* Write your T-SQL query statement below */

select  round( 1.0 * count(case when order_date = customer_pref_delivery_date then 1 end ) / count(*) * 100, 2) as immediate_percentage 
from
(
select 
    *,
    row_number() over (partition by customer_id   order by order_date ) as rn
from
    Delivery
) as tb 
where rn = 1


