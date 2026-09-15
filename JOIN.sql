use MyDatabase
-- no join between 2 table like customers and orders

SELECT * from customers;
select * from orders;

-- Inner join only matching raws from both the column 

/* syntex - select * from customer <join type(if not provide then default Inner) > join  orders
on <condition> */
select c.id,o.customer_id,c.first_name,o.order_id,o.sales
from customers as c  Inner join dbo.orders as o on c.id = o.customer_id;

-- left join take all raws from the left table and only matching data related show of right table if not exist matching then it give null 
--  orders matter whatever table name consider as left and 2 nd table name as right
select c.id,o.customer_id,c.first_name,o.order_id,o.sales 
from customers as c  Left join dbo.orders as o on c.id = o.customer_id;

-- right join take all raws from the right table and only matching data related show of left
--table if not exist matching then it give null 
--  orders matter whatever table name consider as right and 2 nd table name as  left
select c.id,o.customer_id,c.first_name,o.order_id,o.sales 
from dbo.orders as o  Right join customers as c  on c.id = o.customer_id;

------
select * from orders as o left join customers as c on c.id = o.customer_id;

-- full join - take all data from the both table

select * from customers full join orders on id = customer_id;

-- left anti join take all non matching data of left table using lift join
-- + where condition
select * from customers left join orders on id=customer_id where customer_id is null

-- right anti join take all non matching data of right table using  right join
-- + where condition
select * from customers  right join orders on id=customer_id where  id is null

-- full anti join  means no matching data between 2 table oposite of inner join
select * from customers full join orders on id = customer_id 
where id is null or customer_id is null

-- 
select * from customers left join orders on id = customer_id 
where  customer_id is not null;

select * from customers inner join orders on id = customer_id 


-- cross join cartesian product all combination

select * from customers cross join orders

--- using salesdb,retrive all list of all orders, along with the related customer,product
--and employee details . 
/* for each order display ;
- order ID
- customer's name
- product name
- sales amount
- product price
- salesman's name 
*/
Use SalesDB;
select * from Sales.Customers;
select * from Sales.Employees;
select * from Sales.Orders;
select * from Sales.OrdersArchive;
select * from Sales.Products;

select 
OrderID,
Sales
from sales.Orders;