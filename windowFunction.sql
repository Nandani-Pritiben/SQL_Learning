-- partitioning by means access only specific segments in the column
--or larger table


-- Example find the total sales of each product with additional 
--details such as orderID,Order date
select
ProductID,
OrderID,
sum(Sales) over(partition by ProductID) as totalsales,
OrderDate
from Sales.Orders

-- Aggregration -- Over clause - it tells the sql to use window 
-- function that defines window or subset of data
-- AVG(sales) 
--Over(partition by 
--ProductID Order BY Sales DESC ROWS UNBOUNDED PRECEDING )
-- Aggregration function in over clause order by optional but for
-- Value analyzed and rank functions require order by because without
-- osorting how you sort data using order by then give ranks


-- Rank Each order based on their sales from highest to lowest
-- Additionally provide details such as OrderID,OrderDate

Select
Sales,
RANK() Over(Order by Sales DESC) SalesRank,
OrderID,
OrderDate
from Sales.Orders

-- window frame -Define subset of rows within each window

-- window function -- calcu;ation on rows but not 
-- collapse rows 
-- syntex - Function + Over(partition+order for sorting + 
-- Frame) EX- AVG(sales) 
--Over(partition by 
--ProductID Order BY Sales DESC ROWS UNBOUNDED PRECEDING )
-- frme Types + Frame boundary(Lower val) + 
--Frame boundary(higher val) Example
-- Rule 1 use frmame with order by and always describe 
--lower val first
-- Example -- FRAME- ROWS BETWEEN CURRENT VALUE AND
--UNBOUNDED FOLLOWING

-- 
SELECT
OrderID,
OrderDate,
OrderStatus,
Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus Order By OrderDate
ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS TotalSales
From Sales.Orders
---
SELECT
OrderID,
OrderDate,
OrderStatus,
Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus Order By OrderDate

--ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS TotalSales
-- Shortcut for preceding only you can use unbounded preceding also
ROWS 2 PRECEDING ) AS TotalSales
From Sales.Orders