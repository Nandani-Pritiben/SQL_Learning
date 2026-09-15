-- Count- it count rows when COUNT(*) but it count non nullonly
-- count(column) -- used for analysis of duplicates
-- check in order any duplicates
SELECT
OrderID,
COUNT(1) OVER(PARTITION by OrderID) AS OrderCount
FROM 
Sales.Orders
--
SELECT
*
FROM(
SELECT
OrderID,
COUNT(1) OVER(PARTITION by OrderID) AS OrderCount
FROM Sales.OrdersArchive)t where OrderCount>1
-- sum() function return all sales in same window

-- Find the percentage of contribution of each products 
-- sales to the total sales
select
OrderID,
ProductID,
Sales,
SUM(Sales) OVER() TOTALSALES,
ROUND(CAST(Sales AS float)/SUM(Sales) OVER()  * 100,2)
PERCENTAGE_OF_SALES
from Sales.Orders

-- AVG()--
-- find avg score of customers and provide additional details
-- such CustomerID and LastName
SELECT
CustomerID,
LastName
Score,
AVG(COALESCE(Score,0)) Over() AverageScore
FROM Sales.Customers
-- MIN/MAX
-- Show the highest salary of the compney
SELECT
*
FROM(
SELECT
*,
MAX(Salary) over() HighestSalary
FROM Sales.Employees)t
where Salary=HighestSalary

-- find the deviation of sales from the minimum and maximum amount
select
Sales,
MIN(Sales) Over() minimumSales,
MAX(Sales) Over() maximumSales,
Sales-MIN(Sales) Over() minimumDeviationSales,
MAX(Sales) Over() -Sales  maximumDeviationSales
From Sales.Orders
-- Running total - means all total start to end it is not
-- drop data
-- Rolling total - is alway s shift window and give total 
-- of current example- last 30 days sales and dropping 
-- old one data with time

-- Example Calculation moving avg / Running avg
--of sales of each
-- product with over time
SELECT
OrderID,
ProductID,
OrderDate,
Sales,
AVG(Sales) Over(PARTITION BY ProductID) AvgSales,
AVG(Sales) Over(PARTITION BY ProductID Order By OrderDate 
ASC) MovingAvgSales,
AVG(Sales) Over(PARTITION BY ProductID Order By OrderDate 
ASC Rows Between Current Row AND 1 Following) RollingAvgSales
From Sales.Orders

