-- tip 7 - instead of using multiple OR use in


-- bad practice --
select * from SalesDB.Sales.Customers where CustomerID=1 or CustomerID=2 or CustomerID=3

-- good practice --
select * from SalesDB.Sales.Customers where CustomerID IN (1,2,3)