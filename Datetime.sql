use salesdb;
-- date name given numbers but datatype string and some output given string like month weekday
select DATENAME(month,creationtime) from sales.orders;
select DATENAME(weekday,creationtime) from sales.orders;

-- date trunc that if you want to fetch only limited information of date apart from 
--this all is reset 00 or accordingly then use datetrunc
-- here after min everything reset 0
select datetrunc(minute,creationtime) from sales.orders;
-- here after month day on 01 andd second 0 
select datetrunc(mm,creationtime) from sales.orders;
--same for year apart from year month ,day are 1 and other is 0
select datetrunc(year,creationtime) from sales.orders;

 select datetrunc(month,creationtime) as startofmonth,
 eomonth(creationtime) eomonths from sales.orders;

 --- Datetime2 -> yyyy-MM-dd HH-mm-ss Capital M means month and small m means minute
 -- international standard yyyy-MM-dd 1. usa standars- MM-dd-yyyy 
 --2. European standard dd-MM-yyyy