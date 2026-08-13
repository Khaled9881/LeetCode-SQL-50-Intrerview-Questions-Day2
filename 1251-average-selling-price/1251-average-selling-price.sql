/* Write your T-SQL query statement below */

select p.product_id, round( coalesce(1.0 * Sum(u.units * p.price) /  nullif(Sum(u.units), 0), 0), 2) as average_price 
from Prices p left join UnitsSold u
on p.product_id = u.product_id
   AND u.purchase_date BETWEEN p.start_date AND p.end_date
group by p.product_id