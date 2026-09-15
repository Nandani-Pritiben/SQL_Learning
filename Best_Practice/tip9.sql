-- tip 9 use ansi join explicite join instead of non ansi join implicite join

-- bad Practice
select * from SalesDB.Sales.Customers c,SalesDB.Sales.Orders o  where c.CustomerID=o.CustomerID

-- good practice

select * from SalesDB.Sales.Customers c  Inner Join SalesDB.Sales.Orders o on c.CustomerID=o.CustomerID