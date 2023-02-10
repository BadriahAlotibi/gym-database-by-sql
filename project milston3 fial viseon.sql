/*Students name and ID:
Badriah Alotibi-2200001298
Khadijah alahmar - 2210003523
Batool al salim-2210003514
Shaden alzahrani-2210003675*/

-- we cerate our database Gym

Create database Gym;
use Gym;

-- we create table for the consumer include all of them attrbites or datas.

Create table consumer (cons_id int primary key , phone_number int(10)not null,
length int, age int, cf_name varchar(20)not null ,cm_name varchar (20), cl_name varchar(20)not null, weight int);

-- we craete table for the payment method that the consumer will use.
Create table Payment (Pay_ID int primary key , date_train date, price int, Payment_type char(15),
co_id int, foreign key(co_id) references consumer (cons_id));

-- we craete table for each manger who manged the trainer
Create table Mangers (M_ID int primary key , phone_number char(20),
mf_name varchar (20),mm_name varchar (20),ml_name varchar (20));

-- we craete table for the trainer include his data which the consumer will choose.
Create table trainer (train_ID int primary key ,tf_name varchar(20), tm_name varchar (20),tl_name varchar(20), age int,
Price int, mang_id int, foreign key (mang_id) references Mangers (M_id));

-- we craete table for tarinig paln for the consumer.
Create table training_plan (plan_ID int primary key ,  date_tr date ,plan_time time,consumer_id int,
foreign key(consumer_id) references consumer (cons_id),trainer_id int,
foreign key (trainer_id)  references trainer (train_ID));

-- we craete table for the employee acceses in the system of the gym.
Create table employee_acceses(Em_id int primary key , password varchar(20),email varchar(50),
tr_id int, foreign key(tr_id) references Trainer (train_id));

-- we create table for the subscription of the cinsumer.
Create table Subscription (Sub_ID int primary key , Sub_date date, Sub_time time,
con_id int ,foreign key (con_id) references consumer(cons_id));

-- we craete table for the Equipment that the consumer want to use.
Create table Equipment(E_ID int primary key , E_name varchar(20), E_type char (15), c_id int ,
foreign key(c_id) references consumer (cons_id),
subs_id int, foreign key(subs_id) references Subscription (sub_ID),p_id int,
foreign key(p_id) references training_plan (plan_ID));

-- we craete table that make the Gust or consumer access the system of the Gym.
Create table Gust_access (G_ID int primary key , G_email varchar(40) , pass_word varchar(20),
cosumers_id int, foreign key (cosumers_id) references consumer (cons_id));

Create table Train_class(trc_id int primary Key,trc_name varchar(20),class_num int,tcconsumer_id int,tcplan_id int, 
foreign key(tcconsumer_id)references consumer(cons_id),
 foreign key(tcplan_id)references training_plan(plan_ID));
 

-- start to include data for each table.
insert into consumer
values(101,0558840009,154,25, 'Ahmed', 'Mohammed', 'Alanzi',60);
insert into consumer
values(102,0558841459,160,30,'Khiled', 'Salim',' Alotibi',70);
insert into consumer
values(103,0502066543,170,23,'Ali', 'Nassser', 'Alqahtani',65);
insert into consumer
values(104,0502066543,179,29,'Abdullah', 'saud', 'Alqahtani',72);

insert into Mangers
values(301,0557463524,'Omar', 'Ahmed', 'Alnasser');
insert into Mangers
values(302,055749264,'Marzooq' , 'fahad', 'Alotibi');
insert into Mangers
values(303,0557460192,'Faisal', 'sami', 'Alqadir');
insert into Mangers
values(304,0567387291,'Mousa', 'Ali', 'Alrashd');

insert into trainer
values(1001,'Ahmed', 'Ali', 'khiled',50,300,301);
insert into trainer
values(1002,'Yosuif',' Ali', 'khiled',35,150,301 );
insert into trainer
values(1003,'Aiman', 'Salim',' Alili',37,250,302);
insert into trainer
values(1004,'Same', 'Sallah',' Alotibi',42,250,303);


insert into Payment
values(11000,'2021-01-19',250,'apple pay',103);
insert into Payment
values(11001,'2023-01-01',300,'visa',103);
insert into Payment
values(11002,'2023-01-07',500,'cash',101);
insert into Payment
values(11003,'2022-12-29',250,'apple pay',102);

insert into training_plan
values(33000,'2022-11-20','01:00',101,1002);
insert into training_plan
values(33001,'2023-01-02','09:00',102,1001);
insert into training_plan
values(33002,'2022-03-29','10:00',101,1002);
insert into training_plan
values(33003,'2023-01-04','03:00',103,1004);


insert into employee_acceses
values(10001,'sm*ndj','em10001@gmail.com',1003);
insert into employee_acceses
values(10002,'@kjdic','em10002@gmail.com',1001);
insert into employee_acceses
values(10003,'_efjiji','em10003@gmail.com',1002);
insert into employee_acceses
values(10004,'Akds*12','em10004@gmail.com',1004);

insert into Subscription
values(000,'2023-01-16','10:00',101);
insert into Subscription
values(001,'2023-01-11','12:00',102);
insert into Subscription
values(002,'2023-01-08','09:00',103);
insert into Subscription
values(003,'2023-01-03','01:00',104);

insert into Equipment
values(90000,'upper body machin','h',101,000,33000);
insert into Equipment
values(90001,'Lower body machin','M',102,001,33001);
insert into Equipment
values(90002,'full body machin','L',103,002,33002);
insert into Equipment
values(90003,'arm machin','A',104,003,33003);


insert into Gust_access
values(100099,'gs100099@gmail.com','gs@001',101);
insert into Gust_access
values(100082,'gs100082@gmail.com','gs@0*2',102);
insert into Gust_access
values(100049,'gs100049@gmail.com','gs#kma',103);
insert into Gust_access
values(100050,'gs100050@gmail.com','Tajf&23',104);

insert into Train_class
 values (400, 'Yoga', 1 ,101 , 33000);
 insert into Train_class
 values (401, 'Hard training', 2 ,102 , 33002);
 insert into Train_class
 values (402, 'Cardio', 3 ,103 , 33001);
 insert into Train_class
 values (403, 'meditition', 4 ,104 , 33002);
 


use gym;
-- to add new column to use in having
alter table training_plan add column state_date varchar(20);

-- update plan time for traning time table
use gym;
update training_plan set plan_time = '02:00' where  plan_ID=33000;
use gym;
update training_plan set plan_time = '03:10' where  plan_ID=33001;
use gym;
update training_plan set plan_time = '04:15' where  plan_ID=33002;
use gym;
update training_plan set plan_time = '01:00' where  plan_ID=33003 ;

-- constraint
use Gym;
alter table payment
add constraint payment_type check (payment_type = 'apple pay' or payment_type='visa'or payment_type='credit card'
or payment_type='cash');

-- to show column from table
select cons_id,phone_number,cf_name from consumer;

select plan_ID, date_tr  from training_plan ;

use Gym;

-- to show all the columns in the table
show columns from trainer;

use Gym;

-- to add new column to the table
Alter table trainer
ADD trainer_languge varchar(20);

-- to show data from different tables in DB
select *from consumer where cf_name='Khiled';
select *from trainer where Price>150;
select *from Mangers where M_ID=301;

use trainer;
-- to update value in table
update trainer
set Price=550 where train_ID=1003;
use Gym;
-- to change data type
Alter table trainer Modify column Price decimal (20.0);
use Gym;

-- to drop coulmn from table
Alter table Equipment
drop  E_type;
use Gym;

-- to show all tables in DB
show tables;
use Gym;

-- using Rename to change table name
Alter table Subscription Rename to Mambership;
use Gym;

-- drop or delete table Equipment
drop table Equipment;
use Gym;

-- using order by
select*from consumer
order by cf_name Asc;

use Gym;
-- using delete
delete from training_plan where plan_ID=33000;
use Gym;
-- using Group by
select Price from trainer Group by Price;


use Gym;
-- using like
select *from consumer where cf_name like 'A%';
use Gym;
-- using Between
select trainer.tf_name,trainer.train_ID,trainer.Price
from trainer where trainer.Price BETWEEN 150 AND 300;
-- using in
use Gym;
select training_plan.date_tr,training_plan.plan_time
from training_plan where training_plan.Type in ('2022-11-20','10;00');

select * from consumer where cf_name IN ('Ahmed','Ali');

-- is null
use gym;
select Payment.Payment_type,Payment.price from Payment where Payment.price is null order by price;

-- using union
use gym;

select cons_id from consumer union select consumer_id from training_plan;


-- view

create view bonus 
as select (price * 0.1 + price) from trainer;

create view descending_manger
as select * from Mangers order by mf_name desc ; 


-- nested qureies
select * from consumer 
where age < any (select age from trainer);

select train_id,tf_name,age from trainer 
where age  > all (select age from consumer);

-- exist
select tf_name , tl_name
from trainer
where exists (select * from training_plan where train_ID = trainer_id);

-- procedure
delimiter $$
CREATE PROCEDURE newprice (in Price int , out bonus int)
begin
SELECT price*0.2 into bonus;
end ; $$
delimiter ;

call newprice (250 ,@bonus);
select train_ID, tf_name, price , @bonus+price as newprice from trainer;

-- function
delimiter $$
create function decrease_price(unit_price int) returns int deterministic
begin
declare new_price int;
select price-100 into new_price from trainer where price = unit_price ;
return new_price;

end ; $$
delimiter ;
select train_ID, decrease_price(price) as new_price from trainer;

-- trigger

delimiter //
create trigger undeined_age before insert 
on consumer
for each row 
if new.age < 18
then signal SQLSTATE '45000' set message_text = 'you must enter age greater than 18';
end if ; 

show triggers;

drop trigger undeined_age;

-- using having to find the count for each id number
use gym;
select count(cons_id),cf_name
from consumer
group by cf_name
having count(cons_id) ;