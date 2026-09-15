-- no of orders every year,month, month in string
select
year(OrderDate),
COUNT(*) nrOfOrders
from SalesDB.Sales.Orders
Group by year(OrderDate)

select
month(OrderDate),
COUNT(*) nrOfOrders
from SalesDB.Sales.Orders
Group by month(OrderDate)

select 
DATENAME(month,OrderDate),
COUNT(*) nrOfOrders
from SalesDB.Sales.Orders
 GROUP BY DATENAME(month,OrderDate)