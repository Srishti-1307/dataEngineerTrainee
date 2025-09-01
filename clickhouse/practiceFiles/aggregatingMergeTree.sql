
'Merge Tree Engine'
create table raw_data(event_time datetime, user_id int, page_url varchar)
engine = MergeTree()
order by event_time


'Aggregating Merge Tree Engine'
create table aggregated_data(event_time datetime, page_url varchar, 
unique_visitor AggregateFunction(uniq, int),
total_visitor AggregateFunction(count, int))
engine = AggregatingMergeTree()
order by (event_time, page_url)


'Creating mv'
create materialized view user_count_mv to aggregated_data as 
select event_time, page_url,
uniqState(user_id) as unique_visitor, 
countState(user_id) as total_visitor 
from raw_data 
group by event_time, page_url




'Inserting values in source table'
insert into raw_data values
('2025-08-21 10:00:00', 1, '/home'),
('2025-08-21 10:05:00', 2, '/home'),
('2025-08-21 10:10:00', 1, '/products'),
('2025-08-21 10:15:00', 3, '/home'),
('2025-08-21 10:20:00', 2, '/products')



'quering target table'
select * from aggregated_data1


'When querying, use the corresponding -Merge aggregate functions to finalize the aggregation.'
SELECT event_time, page_url,
uniqMerge(unique_visitor) AS unique_users,  
countMerge(total_visitor) AS total_users   
from aggregated_data
GROUP BY event_time, page_url
ORDER BY event_time, page_url




















































