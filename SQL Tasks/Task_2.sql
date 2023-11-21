create database exercise2

create table salesman (
salesman_id int primary key,
name varchar(30) not null,
city varchar(30) ,
comission float not null)

create table customer(
customer_id int primary key,
customer_name varchar(30) not null,
city varchar(30),
grade int not null,
salesman_id int )

create table orders(
order_no int primary key,
purch_amt float not null,
order_date date,
customer_id int,
salesman_id int)

alter table customer add foreign key (salesman_id) references salesman(salesman_id)

alter table orders add foreign key (customer_id) references customer(customer_id)

alter table orders add foreign key (salesman_id) references salesman(salesman_id)

insert into salesman values(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5003,'Lauson Hen',null,0.12),
(5007,'Paul Adam','Rome',0.13)

select * from salesman

insert into customer values
(3002,'Nick Rimando','New york',100,5001),
(3005,'Graham Zusi','California',200,5002),
(3001,'Brad Guran','London',400,null),
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Davis','New york',200,5001),
(3009,'Geoff Camero','Berlin',100,null),
(3008,'Julian Green','London',300,5002),
(3003,'Jozy Altidor','Moncow',200,5007)

select * from customer

insert into orders values
(70001,150.5,'2016-10-05',3005,5002),
(70009,270.65,'2016-09-10',3001,null),
(70002,65.26,'2016-10-05',3002,5001),
(70004,110.5,'2016-08-17',3009,null),
(70007,948.5,'2016-09-10',3005,5002),
(70005,2400.6,'2016-07-27',3007,5001),
(70008,5760,'2016-09-10',3002,5001),
(70010,1983.43,'2016-10-10',3004,5006),
(70003,2480.4,'2016-10-10',3009,null),
(70012,250.45,'2016-06-27',3008,5002),
(70011,75.29,'2016-08-17',3003,5007)

select * from orders

create table nobel_win (
year int not null,
subject varchar(30) not null,
winner varchar(30) not null,
country varchar(30) not null,
category varchar(30) not null)

insert into nobel_win values
(1970,'Physics','Hannes Alfven','Sweden','Scientist'),
(1970,'Physics','Louis Neel','France','Scientist'),
(1970,'Chemistry','Luis Federico Leloir','France ','Scientist'),
(1970,'Physiology','Ulf von Euler','Sweden','Scientist'),
(1970,'Physiology','Bernard Katz','Germany','Scientist'),
(1970,'Literature','Aleksandr Solzhenitsyn','Russia','Linguist'),
(1970,'Economics','Paul Samuelson','USA','Economist'),
(1970,'Physiology','Julius Axelrod','USA ','Scientist'),
(1971,'Physics','Dennis Gabor','Hungary','Scientist'),
(1971,'Chemistry','Gerhard Herzberg ','Germany','Scientist'),
(1971,'Peace','Willy Brandt','Germany','Chancellor'),
(1971,'Literature','Pablo Neruda','Chile','Linguist'),
(1971,'Economics','Simon Kuznets','Russia ','Economist'),
(1978,'Peace','Anwar al-Sadat','Egypt ','President'),
(1978,'Peace','Menachem Begin','Israel','Prime Minister'),
(1987,'Chemistry','Donald J. Cram','USA ','Scientist'),
(1987,'Chemistry','Jean-Marie Lehn ','France','Scientist'),
(1987,'Physiology','Susumu Tonegawa','Japan','Scientist'),
(1994,'Economics','Reinhard Selten','Germany','Economist'),
(1994,'Peace','Yitzhak Rabin','Israel','Prime Minister'),
(1987,'Physics','Johannes Georg Bednorz','Germany','Scientist'),
(1987,'Literature','Joseph Brodsky','Russia','Linguist'),
(1987,'Economics','Robert Slow','USA','Economist'),
(1994,'Literature','Kenzaburo Oe','Japan','Linguist')

create table item_mast(
pro_id int primary key,
pro_name varchar(30) not null,
pro_price float not null,
pro_com int not null)

insert into item_mast values
(101,'Mother Board',3200.00,15),
(102,'Key Board',450.00,16),
(103,'ZIP drive',250.00,14),
(104,'Speaker',550.00,16),
(105,'Monitor',5000.00,11),
(106,'DVD drive',900.00,12),
(107,'CD drive',800.00,12),
(108,'Printer',2600.00,13),
(109,'Refill cartridge',350.00,13),
(110,'Mouse',250.00,12)


/* Question1
Find the name and price of the cheapest item(s).
*/
declare @min int
select @min= min(pro_price) from item_mast
select pro_name,pro_price from item_mast where pro_price=@min

/* Question2
Display all the customers, who are either belongs to the city New York or not 
had a grade above 100. 
*/
select customer_name from customer where city='new york' or grade<=100

/* Question3
Find those salesmen with all information who gets the commission within a 
range of 0.12 and 0.14.
*/
select * from salesman where comission between 0.12 and 0.14

/* Question4
Find all those customers with all information whose names are ending with the 
letter 'n'.
*/
select * from customer where customer_name like '%n'

/* Question5
Find those salesmen with all information whose name containing the 1st 
character is 'N' and the 4th character is 'l' and rests may be any character
*/
select * from salesman where name like 'N__l%'

/* Question6
Find that customer with all information who does not get any grade except 
NULL.
*/
select * from customer where grade=NULL
--Note that when we created customer table we mentioned that grade can't be null. Just I checked

/* Question7
Find the total purchase amount of all orders.
*/
select sum(purch_amt) from orders

/* Question8
Find the number of salesman currently listing for all of their customers.
*/
select count(distinct salesman_id) from customer 

/* Question9
Find the highest grade for each of the cities of the customers.
*/
select city, max(grade) from customer group by city

/* Question10
Find the highest purchase amount ordered by the each customer with their ID 
and highest purchase amount.*/
select customer_id, max(purch_amt) from orders group by customer_id
select max(purch_amt) from orders

/* Question11
Find the highest purchase amount ordered by the each customer on a particular 
date with their ID, order date and highest purchase amount.
*/
select customer_id,order_date, max(purch_amt) from orders group by customer_id,order_date
 
/* Question12
Find the highest purchase amount on a date '2016-08-17' for each salesman 
with their ID.
*/
select max(purch_amt),salesman_id from orders where order_date='2016-08-17' group by salesman_id

/* Question13
 Find the highest purchase amount with their customer ID and order date, for 
only those customers who have the highest purchase amount in a day is more than 
2000.
*/
select customer_id, order_date, max(purch_amt) from orders group by customer_id,order_date
having max(purch_amt)>2000

/* Question14
Write a SQL statement that counts all orders for a date August 17th, 2016.
*/
select count(order_no) from orders where order_date='2016-08-17'