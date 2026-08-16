
select 
    p.employee_id, 
    p.name,
    count(*) as reports_count ,
    ROUND(AVG(1.0 * c.age), 0) as average_age
from
    Employees p join Employees c
on 
    c.reports_to = p.employee_id
group by
    p.employee_id, 
    p.name
order by
    p.employee_id
