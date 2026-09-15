Insert Into dbo.customers (id,first_name,country,score)
values (6,'neha','india',100),
(7,'nirali','india',110);

select * from dbo.customers;

Insert Into dbo.customers (id,first_name,country,score)
values (8,'',null,null),
(9,'',null,null);

CREATE TABLE persons (
id INT NOT NULL,
person_names VARCHAR(50) NOT NULL,
birth_date VARCHAR(50),
phone VARCHAR(15) NOT NULL,
CONSTRAINT pK_persons PRIMARY KEY (id)
)


Insert Into dbo.customers (id,first_name)
values (10,'harsh');
 

 use MyDatabase
 Insert INTO persons (id,person_names,birth_date,phone)
 select 
 id,
 first_name,
 NULL,
 '12345'
 from customers;

 select * from persons;

 -- update data
 /* update table_name
   set col1=val1,
       col2=val2
   where <condition> */

   update dbo.customers
   set score=0
   where id=6;

   select * from dbo.customers

    update dbo.customers
   set score=0,
       country='UK'
   where id=10;

   select * from dbo.customers

   update dbo.customers
   set first_name='n1',
       score=0
       where score is null

   select * from dbo.customers where score is null;

   select * from dbo.persons where id>5;

   delete from dbo.persons
   where id>5;

   --- Truncate without checking and logging it delete data faster in table

   Truncate table persons