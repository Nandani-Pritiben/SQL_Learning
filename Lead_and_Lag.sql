-- LEAD(),LAG()

select
MonthNumber,
(CurrentMonthSales-LastMonthSales) MOMChange,

ROUND(CAST((CurrentMonthSales-LastMonthSales)AS Float)/LastMonthSales * 100,1) MOMChangePercentage
from(
Select
Month(OrderDate) MonthNumber,
Sum(Sales) CurrentMonthSales,
LAG(SUM(Sales)) Over(order by Month(orderDate)) LastMonthSales
From
SalesDB.Sales.Orders GRoup by Month(OrderDate)
)t

-- Average order days for each customer

select
CustomerID,
AVG(OrderDay)  AverageDay,
ROW_NUMBER() Over(Order BY AVG(OrderDay) DESC) RankOfAverageDay
from(
Select
OrderDate CurrrentDate,
CustomerID,
LEAD(OrderDate) Over(Partition by CustomerID Order by OrderDate) PreviousDate,
DATEDIFF(DAY,OrderDate,LEAD(OrderDate) 
Over(Partition by CustomerID Order by OrderDate)) OrderDay

from SalesDB.Sales.Orders)t
Group by CustomerID