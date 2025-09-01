CREATE TABLE department (
    dept_id UInt32,
    dept_name String,
    dept_location String,
    budget UInt32,
    head_of_dept String
) ENGINE = MergeTree
ORDER BY dept_id;




CREATE TABLE employee (
    emp_id UInt32,
    emp_name String,
    dept_id UInt32,
    salary UInt32,
    join_date Date,
    location String,
    role String,
    experience_years UInt8
) ENGINE = MergeTree
ORDER BY emp_id;




select * from employee

select * from department




1. Find the top 5 highest-paid employees in each department.
2. Calculate the average salary per department location.
3. Show departments with average salary > ₹80,000 and more than 5 employees.
4. Find the department with the highest total salary expense.
5. Show salary distribution per department using buckets (<60k, 60k-90k, >90k).
6. Identify roles where the average experience is above 10 years



#1
select sub_joined.emp_name, sub_joined.salary, sub_joined.dept_name, sub_joined.rnk 
from (select e.emp_name, e.salary, d.dept_name, rank() 
over(partition by d.dept_name order by e.salary desc) as rnk 
from employee e 
join department d    
on e.dept_id = d.dept_id  ) as sub_joined
where sub_joined.rnk<=5




#2 


















