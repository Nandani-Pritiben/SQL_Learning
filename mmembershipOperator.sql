--membership operator IN and NOT IN check that is the value in the list
select * from customers where country='USA' or country='Germany';

select * from customers where country IN ('USA','Germany');

-- NOT IN

select * from customers where country not in ('USA','Germany');

-- Search Operator-- Like = search for a pattern in your text\
/* % = anything 2. _ = Exact 1

M%, %M%,%M,__M%  */

select * from customers where first_name LIKE 'M%';


