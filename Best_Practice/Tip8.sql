-- Tip8 - understand the Speed of Joining and try to use Inner Join because It
-- is more faster

--1
select * from SalesDB.Sales.Customers c INNER JOIN SalesDB.Sales.Orders o on c.CustomerID=o.CustomerID

-- 2
select * from SalesDB.Sales.Customers c Left JOIN SalesDB.Sales.Orders o on c.CustomerID=o.CustomerID
select * from SalesDB.Sales.Customers c Right JOIN SalesDB.Sales.Orders o on c.CustomerID=o.CustomerID

-- 3
select * from SalesDB.Sales.Customers c full join SalesDB.Sales.Orders o on c.CustomerID=o.CustomerID