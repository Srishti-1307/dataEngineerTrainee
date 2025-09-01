Recursion in SQL  

'Example 1'

with RECURSIVE cte as(
select 1 as n
union all
select n+1 from cte
where n<4
)
select * from cte


with recursive cte as(
select 1 as n 
union all
select n+2 from cte 
where n<4
)
select * from cte

-----------------------------------------------------------------------------


'Example 2'

select * from employee

ALTER table employee 
update managerid = null where name = 'A'

alter table employee
modify column managerid Nullable(int)



with recursive cte as(
select * from employee  
where empid = 5
union all 
select e.* from employee e
join cte 
on e.empid = cte.managerid
)

select * from cte

---------------------------------------------------------------------------------------------------------



Category tree: The data structure itself, representing a hierarchy.
Recursive CTE: The SQL technique used to interact with and process hierarchical data like a category tree.


























































