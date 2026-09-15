-- tip 10 make sure to indx the column used where clause

select * from SalesDB.Sales.Customers c inner join SalesDB.Sales.Orders o on c.CustomerID=o.CustomerID

-- index 
create nonclustered index idx_Orders_CustomerID ON  SalesDB.Sales.Orders(CustomerID)