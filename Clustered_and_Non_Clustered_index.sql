use SalesDB
Select
*
from Sales.DBCustomer
 -- defaullt type is non_clustered Index
create clustered index idx_DBCustomer_CustomerID ON
Sales.DBCustomer (CustomerID)

-- only one clustered index allow in one table
create nonclustered index idx_DBCustomer_FirstName ON
Sales.DBCustomer (FirstName)
-- multiple non clustered index
create nonclustered index idx_DBCustomer_LastName ON
Sales.DBCustomer (LastName)

-- non-clustered composite key
create index idx_DBCustomer_CountryScore on
Sales.DBCustomer (Country,Score)
-- int his if yoy use query country and score then follow for country and score 
-- for filtering data and use for counntry also but do not use score 
-- ex if you crete index using a,b,c,d cols then use for (a),(a,b),(a,b,c)
-- do not use for (a,c,d),(b.c.d) etc do not order skip


-- Storage wise 2 types -1.ROWstore and ClolumnStore
-- for rowstore if you not give any type then rowstore
-- Syntex for columnStore
CREATE Clustered ColumnStore INDEX idx_Clustered_ColumnStore_DBCustomer
on Sales.DBCustomer

-- NonClustered columnstore
CREATE Clustered ColumnStore INDEX idx_Clustered_ColumnStore_DBCustomer
on Sales.DBCustomer 

--multiple column store index in table are not allowed
-- Column Store->,Heap structure->,Row structure 
--less to high space flow
-- Drop index
DROP Index idx_NONClustered_ColumnStore_DBCustomer on
Sales.DBCustomer

-- Unique index

Select * from Sales.Products

CREATE UNIQUE NONCLUSTERED INDEX idx_Products_Category
on Sales.Products (Category) 

-- Filtered Index  this is not apply on 
--clustered and column store index

Select * from Sales.Customers where Country='Germany'

CREATE NONCLUSTERED INDEX 
idx_Customer_NONCLuster_RS_Filter 
on Sales.Customers (Country) where Country='USA'

Insert into Sales.Customers
(CustomerID,FirstName,LastName,Country,Score)
Values (6,'Nirali','khalas','India',1000)

-- For show the index details-
sp_helpindex 'Sales.DBCustomer'