' returns current date and time'
select now()
select today()




'Type conversion'

' toDate(value): Converts a DateTime or DateTime64 value to a Date type, truncating the time part.'
select toDate(now())
select toDate('2025-08-07 15:30:00')

'toDateTime(value, [timezone]): Converts a Date or DateTime64 value to a DateTime type.'
select toDateTime('2025-08-07')





'Extracting Date/Time Components'

select toYear('2025-08-07 10:30:00')                    'error'
SELECT toYear(toDateTime('2025-08-07 10:30:00')); 
select year(toDateTime('2025-08-07 10:30:00'))

select toMonth(toDateTime('2025-08-07 10:30:00'))
select month(toDateTime('2025-08-07 10:30:00')) as month



select toHour(toDateTime('2025-08-07 10:30:00'))
select minute(toDateTime('2025-08-07 10:30:00'))

select toDayOfMonth(toDateTime('2025-08-07 10:30:00'))
select Day(toDateTime('2025-08-07 10:30:00'))

select Second(toDateTime('2025-08-07 10:30:00'))

select toStartOfMonth(toDateTime('2025-08-07 10:30:00'))

select toStartOfHour(toDateTime('2025-08-07 10:30:00','UTC'))


select toStartOfDay(toDateTime('2025-08-07 10:30:00'),'Asia/Kolkata')        'toStartOfDay((time, 'UTC'), timezone)'

select toStartOfDay(date) from practicedb.product p 

select toStartOfYear(toDateTime('2025-08-07 10:30:00'))

select toDayOfWeek(toDateTime('2025-08-07 10:30:00'))

select toDayOfMonth(toDateTime('2025-08-07 10:30:00'))






'Addition / Subtraction'

'general syntax: function(date_expression, no_of_units)  no_of_units to plus/minus'

select addYears('2023-07-13', 2)
select addWeeks('2023-07-13', 52)
select subtractMonths('2025-09-1', 3)
select subtractDays('2025-03-20', 10)
select addHours('2025-08-11 15:15:10', 4)
select addMinutes(now(), 15)






select formatDateTime(now(), '%y-%m-%d %H:%M:%S')           
'use %y for 25 and %Y for 2025;  %m for 8 and %M for August'

select formatDateTime(toDate('2024-03-15 01:15:50'), '%Y-%M-%d')












