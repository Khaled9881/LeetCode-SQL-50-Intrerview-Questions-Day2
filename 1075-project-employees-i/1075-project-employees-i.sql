/* Write your T-SQL query statement below */

select p.project_id, Round(avg(1.0 * e.experience_years), 2) as average_years
from
    Project p join Employee e
on
    p.employee_id = e.employee_id
group by
    p.project_id