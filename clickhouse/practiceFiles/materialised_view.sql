'Materialized view is a special type of view that pre-computes and stores the results of a query in a separate,
physical table (on disk)

pre-computation: Imagine you have a large table with raw data, and you frequently need to run a complex query that aggregates or transforms this data (e.g., calculating daily totals, grouping by certain criteria).
A materialized view allows you to define this query once.'



'Source Table'
select  * from practicedb.product limit 10

insert into practicedb.product(date, category, price) values
('2025-07-17', 'vitamin', 80)






'Target Table'
create table practicedb.summary(months date, category String, price float)
order by months


'Materialised view'
create materialized view mv to practicedb.summary as 
select Month(date) as months, category, sum(price) as price from practicedb.product 
group by months, category


select * from practicedb.summary












' TRy below TTL creation comand: 
CREATE TABLE my_log_table (
    event_time DateTime,
    message String
) ENGINE = MergeTree()
ORDER BY (event_time)
TTL event_time + INTERVAL 30 DAY;
'
'Below is general formula: 
TTL DATE_COL + interval n day
'












