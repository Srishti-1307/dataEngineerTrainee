# Basic Array join
select name, ingridients from demodb.food
array join ingridients




# ARRAY JOIN with Multiple Arrays: for this pls check: "select * from studentScore"
select id, names, scores from studentScore
array join names, scores



#left Array join 
select id, names, scores from studentScore
left array join names, scores


# array join with aggregation
select name, count(color) from demodb.food
array join color
group by name


# array join with aggregation
select names, sum(scores) from studentScore
left array join scores
group by names



#array zip: arrays inside arrayZip function should be of same size..   arrayZip() takes arrays as arguments
select id, arrayZip(names, scores) as new_column from studentScore



#array join with arrayZip
select id, zippedScore.1, zippedScore.2 from studentScore
array join arrayZip(names, scores) as zippedScore




# groupArray() is an aggregate function

#groupArray()
select location, groupArray(category) from practicedb.product 
group by location

select location, groupArray(distinct category) from practicedb.product 
group by location



#groupArray() with max_size
select location, groupArray(10)(category) from practicedb.product
group by location



# groupArraySorted: returns sorted elements in array
select category, groupArraySorted(5)(`Units Sold`) from practicedb.product 
group by category


# groupUniqArray
select location, groupUniqArray(category) from practicedb.product 
group by location


# groupArrayArray takes array column as input
select groupArrayArray(color) from demodb.food

select foodid, groupArrayArray(color) from demodb.food
group by foodid


