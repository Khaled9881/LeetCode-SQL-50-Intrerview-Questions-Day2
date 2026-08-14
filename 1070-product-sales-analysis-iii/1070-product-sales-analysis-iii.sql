select 
    product_id ,
    year as first_year ,
    quantity ,
    price
from
    Sales s
where
    year = (select min(year) from Sales where product_id = s.product_id)



