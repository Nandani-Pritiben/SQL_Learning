-- equal operator =
select * from customers where country='Germany';

-- not equal != , <>

select * from customers where country != 'Germany';

select * from customers where country <> 'Germany';

-- greater than >

select * from customers where score>500;

-- greater than or equal >=

select * from customers where score>=500;
--  less than <

select * from customers where score<500;

-- less than or equal <=

select * from customers where score<=500;