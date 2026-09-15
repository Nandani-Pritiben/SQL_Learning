-- TIP5 - avoid applying function  using where clause

-- bad practice --
select * from SalesDB.Sales.Customers where SUBSTRING(FirstName,1,1) = 'A'

-- good practice --
select * from SalesDB.Sales.Customers where FirstName Like 'A%'