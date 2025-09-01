'Sampling: allows queries to be executed on a subset of data rather than the entire dataset.
During table creation, SAMPLE BY expression is defined.
This expression should return an integer and sampling columns should ideally be part of the ORDER BY key
for optimal performance and should be a column with high cardinality (like user_id) for random sampling
sampling column: generally UInt type

Applying sampling on Table that did not defined sampling while creation
alter table table_name modify sample by col_name
'

'
Sampling Key column is used to select which data blocks (granules) to include in the sample.
'


create table practicedb.booking(user_id UInt64, date Date, name String, region String, value float)
engine  = MergeTree()
partition by region
order by (user_id, date)
sample by user_id

'hashing function like cityHash64(user_id) can be applied for more randomness'


insert into practicedb.booking values
(101, '2025-05-11', 'Alice', 'North America', 800),
(101, '2025-05-18', 'BOb', 'South America', 700),
(101, '2025-07-21', 'Charlie', 'Asia', 750),
(101, '2025-06-9', 'David', 'South Africa', 790),
(101, '2025-07-31', 'Elena', 'Australia', 840),
(101, '2025-07-13', 'Frank', 'Europe', 810)




'Sampling Queries'

'quering on entire table'
select round(avg(value),2) from practicedb.booking


'quering on fraction of values'
select round(avg(value),2) from practicedb.booking 
sample 0.1


'quering on specific number of values'
select round(avg(value),2) from practicedb.booking 
sample 100


'Sampling with a ratio for ex: take 1 out of 100 values'
select round(avg(value),2) from practicedb.booking 
sample 1/100



'with offset'
select * from practicedb.booking
sample 0.1 offset 0.5

'above query selects 10% of the data, starts from the second half (50% peeche ka, skips 50% aage ka) '






select * from practicedb.product p 


EXPLAIN SELECT 
count(*) 
FROM practicedb.product 
where location = 'Canada'





