--Rank- is always require order by
-- Rank function have 0 arg
-- ROW_NUMBER() it is not handle ties means duplicate sales 
-- give different ROW no
Select
OrderID,
ProductID,
Sales,
ROW_NUMBER() OVER(Order By Sales DESC) RANK_SALES
from Sales.Orders;

-- RANK() - Assign Rank to each row ,it handles ties means duplicate 
-- give same rank . It leaves gaps in rank
Select
OrderID,
ProductID,
Sales,
RANK() OVER(Order By Sales DESC) RANK_SALES
from Sales.Orders;
-- DENSE_RANK() - Assign Rank to each row ,it handles
--ties means duplicate 
-- give same rank . It is nor leaves gaps in rank
Select
OrderID,
ProductID,
Sales,
DENSE_RANK() OVER(Order By Sales DESC) RANK_SALES
from Sales.Orders;

--TOP-N ANALYSIS Ex-
--- find the top highest sales for each product
select
*
From(
Select
OrderID,
ProductID,
Sales,
ROW_NUMBER() Over(Partition By ProductID Order By Sales DESC) Sales_Rank_each_Product
from Sales.Orders)t
where Sales_Rank_each_Product=1
-- BOTTOM_N ANALYSIS Example
select
*
from(
select 
CustomerID,
SUM(Sales) TotalSales,
ROW_NUMBER() OVER(Order by SUM(Sales)) Sales_Rank
from Sales.Orders
Group by CustomerID)t where Sales_Rank<=2
---- select unique id in orderarchiv table
select
ROW_NUMBER() Over(order by OrderID,OrderDate) UNIqueID,
*
from Sales.OrdersArchive
-- remove duplicates
select
*
from(
select 
ROW_NUMBER() 
Over(Partition by OrderID Order By CreationTime) rn,
*
from Sales.OrdersArchive

)t 
where rn=1

-- NTILE()- Divides the row in the specifeid number of equal buckets
-- cums_dist and percent_rank
--percentile rank both use for give ranking between 0 to 1
 