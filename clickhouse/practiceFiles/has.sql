'has() function is used to check if an array contains a specific value. '

select * from demodb.food

select foodid, color from demodb.food 
where has(color, 'red')


with cte as (select foodid, color from demodb.food 
where has(color, 'red'))
select foodid, color from cte array join color






'indexOf(array, element) returns 1-based index of the first occurrence of a specified element 
within an array. If the element is not found, the function returns 0'


select *, indexOf(ingridients, 'water') as index_ingridient, indexOf(color, 'red') as index_color from demodb.food


'indexOf() for filtering: '
select * from demodb.food 
where indexOf(color, 'red') > 0





'Store customer preferences in an array and find matches.
Explore weather events from array columns (e.g., [“rain”, “wind”]).
Count how often “ice cream” appears in product descriptions.
'

select * from demodb.customer

select cid from demodb.customer
where has(preference, 'donuts')


select cid, preference from demodb.customer
array join preference
where preference ='donuts'


with cte as(
select cid, preference from demodb.customer
array join preference
where preference ='ice cream')
select count(preference) from cte 



SELECT toString(['apple', 'banana', 'orange'])

















