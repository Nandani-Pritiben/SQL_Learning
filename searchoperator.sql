--- search operator like use % for anything and use _ for exact 1
Select * from customers where first_name LIKE 'M%';

Select * from customers where first_name LIKE '%r%';

select * from customers where first_name LIKE '%in';

-- _ 3rd position r 

select * from customers where first_name LIKE  '__r%'