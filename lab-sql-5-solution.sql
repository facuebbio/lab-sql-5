use sakila;

## 1. Drop column picture from staff.
select * from staff;

alter table staff
drop column picture;

## 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from staff;
insert into staff
	values
	(4, "Tammy", "Sanders",3, "Tammysanders@sakilastaff.com", 1, 1, "Tammy", "9cb2237d0679ca88db6464eac60da96345513965", "2006-02-15 03:57:16");
update staff
set staff_id = 3
WHERE staff_id = 4;

## 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
## You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information
## you would need to add there. You can query those pieces of information. For eg., 
## you would notice that you need customer_id information as well. To get that you can use the following query: 
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; # id:130, rental_date: 2005-05-25 21:21:56, inventory_id: 3990, staff_id: 2
select * from store;

## 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, 
## and the date for the users that would be deleted. Follow these steps:
## Check if there are any non-active users
## Create a table backup table as suggested
## Insert the non active users in the table backup table
## Delete the non active users from the table customer

select customer_id, email from customer where active = 0;

create table deleted_users (
    customer_id int,
    email varchar(255),
    deletion_date timestamp
);

insert into deleted_users (customer_id, email, deletion_date)
values
(16, 'SANDRA.MARTIN@sakilacustomer.org', current_timestamp),
(64, 'JUDITH.COX@sakilacustomer.org', current_timestamp),
(124, 'SHEILA.WELLS@sakilacustomer.org', current_timestamp),
(169, 'ERICA.MATTHEWS@sakilacustomer.org', current_timestamp),
(241, 'HEIDI.LARSON@sakilacustomer.org', current_timestamp),
(271, 'PENNY.NEAL@sakilacustomer.org', current_timestamp),
(315, 'KENNETH.GOODEN@sakilacustomer.org', current_timestamp),
(368, 'HARRY.ARCE@sakilacustomer.org', current_timestamp),
(406, 'NATHAN.RUNYON@sakilacustomer.org', current_timestamp),
(446, 'THEODORE.CULP@sakilacustomer.org', current_timestamp),
(482, 'MAURICE.CRAWLEY@sakilacustomer.org', current_timestamp),
(510, 'BEN.EASTER@sakilacustomer.org', current_timestamp),
(534, 'CHRISTIAN.JUNG@sakilacustomer.org', current_timestamp),
(558, 'JIMMIE.EGGLESTON@sakilacustomer.org', current_timestamp),
(592, 'TERRANCE.ROUSH@sakilacustomer.org', current_timestamp);

## I will rename the column "deletion_date" to "date"
select * from deleted_users;
alter table deleted_users
rename column deletion_date to date;

## i will delete the non-active users:
delete from payment where customer_id in (
    16, 64, 124, 169, 241, 271, 315, 368, 406, 446, 482, 510, 534, 558, 592
);

select * from payment;






