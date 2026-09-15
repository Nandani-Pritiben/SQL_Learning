-- TIP 4 Create Non Clustered Index on frequently used columns using where clause--

Select * from SalesDB.Sales.Orders where OrderStatus='Delivered'

-- make non clustered index --

CREATE NONCLUSTERED INDEX idx_ORDER_ORDERStatus ON SalesDB.Sales.Orders(OrderStatus)