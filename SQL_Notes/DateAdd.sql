-- DATEADD() --adds or subtract specific time interval to/from a date
/*
Syntex- DATEADD(part,interval,date)
Example- 
DATEADD(month,-4,OrderDate),
DATEADD(year,4,OrderDate),
*/
Select
CreationTime,
DATEADD(YEAR,2,CreationTime) AS [TWO YEARS LATER],
DATEADD(MONTH,-2,CreationTime) AS [TWO MONTHS BEFORE]
from Sales.Orders

/* DATEDIFF - difference beetween dates 
DATEDIFF(part,start_date,end_date)
DATEDIFF(year,CreationTime,OrderTime)
*/
select 
OrderDate,
ShipDate,
DATEDIFF(YEAR,OrderDate,ShipDate),
DATEDIFF(MONTH,OrderDate,ShipDate),
DATEDIFF(DAY,OrderDate,ShipDate)
from Sales.Orders;
-- employee age
select 
BirthDate,
DATEDIFF(YEAR,BirthDate,GETDATE()) as age
from Sales.Employees

-- find the average days shipping duration of each month

select
MONTH(OrderDate) orderOfMonth,
AVG(DATEDIFF(DAY,OrderDate,ShipDate)) AverageShipDay
from Sales.Orders 
Group by MONTH(OrderDate);
-- difference between currentdate and previous date
select
OrderID,
OrderDate as currentDate,
LAG(OrderDate) Over(Order by Orderdate) as PreviousOrderDate,
DATEDIFF(day,LAG(OrderDate) Over(Order by Orderdate),OrderDate) as DifferenceBeetwen
from Sales.Orders