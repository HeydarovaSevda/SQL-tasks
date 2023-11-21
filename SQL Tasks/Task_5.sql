--Use Exercise database to answer these questions from previous files


--1st question
/*
Write a SQL query to find the salespeople and customers who live in the 
same city.Return customer name, salesperson name and salesperson city.
*/
select C.Customer_name, S.name as Salesperson_name, S.city from customer as C 
inner join salesman as S on c.city=s.city

--2nd question
/*
Write a SQL query to locate all the customers and the salesperson who 
works for them. Return customer name, and salesperson name.
*/
select C.Customer_name, S.name as Salesperson_name from customer C 
inner join salesman S on C.salesman_id=S.salesman_id

--3rd question
/*
Write a SQL query to find those salespeople who generated orders for their 
customers but are not located in the same city. Return ord_no, cust_name, 
customer_id (orders table), salesman_id (orders table).
*/
select O.order_no, C.customer_name, O.customer_id, O.salesman_id from 
salesman s inner join orders o on s.salesman_id=o.salesman_id 
inner join customer C on O.customer_id=C.customer_id where c.city<>s.city

--4th question
/*
Write a SQL query to find those customers where each customer has a grade 
and is served by a salesperson who belongs to a city. Return cust_name as 
"Customer", grade as "Grade".
*/
select c.customer_name as Customer, c.grade as Grade from customer C inner join salesman S
on C.salesman_id=S.salesman_id where S.city is not null and c.grade is not null 

--5th question
/*
Write a SQL query to find those customers who are served by a salesperson 
and the salesperson earns commission in the range of 12% to 14% (Begin 
and end values are included.). Return cust_name AS "Customer", city AS 
"City".
*/
select C.customer_name as Customer, C.city as City from customer C inner join salesman S
on c.salesman_id=s.salesman_id where s.comission between 0.12 and 0.14

--6th question
/*
 Write a SQL query to find all orders executed by the salesperson and 
ordered by the customer whose grade is greater than or equal to 200. 
Compute purch_amt*commission as “Commission”. Return customer name, 
commission as “Commission%” and Commission.
*/
select C.customer_name, S.comission*100 as 'Commission%', O.purch_amt*S.comission as Commission
from orders O inner join salesman S on O.salesman_id=S.salesman_id inner join customer C
on O.customer_id=C.customer_id where C.grade>=200







