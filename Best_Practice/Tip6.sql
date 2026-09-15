-- Tip 6 avoid Using wild card at the beginning in like beacause it prevent to use of
-- index

-- bad practice
select * from SalesDB.Sales.Customers where LastName Like '%Gold%'

-- good practice 

select * from SalesDB.Sales.Customers where LastName Like 'Gold%'