	-- create database
create database FSMS;
	-- select database
use FSMS;
	-- create customer table
create table Customer(cust_id int primary key auto_increment,cust_name varchar(30) not null,
		cust_address varchar(50) not null,contact_no bigint not null,email_id varchar(20) not null unique);
	-- create product table
create table Product(Pro_id int primary key,PName varchar(20) not null,PCategory varchar(20) not null,
		Price int not null);
	-- create shop cart table
create table Shopcart(ScId int primary key, Pro_id int ,foreign key(Pro_id) references Product(Pro_id));
	-- create payment table
create table Payment(Pay_id int primary key,Pay_Category varchar(20) not null);
	-- create order table
create table Order1(Oid int primary key,cust_id int,Pro_id int,Pay_id int, Quantity int not null,OrderDate date not null, 
		foreign key(cust_id) references Customer(cust_id),foreign key(Pro_id) references Product(Pro_id),
        foreign key(Pay_id) references Payment(Pay_id));
        
	-- insert value in customer
insert into Customer(cust_name,cust_address,contact_no,email_id) values('Vihan Kurte','Ratnagiri',9087656743,'vihank06@gmail.com');
select * from Customer;
insert into Customer(cust_name,cust_address,contact_no,email_id) values('Natasha Patil','Mirjole',9908765432,'natashap22@gmail.com'),
		('Pravara Kamble','Kalyan',9580764323,'pravara03@gmail.com'),
        ('Harsh Joshi','Pune',9780654323,'harshj09@gmail.com'),
        ('Astha Kamble','Thane',9678023451,'astha25@gmail.com'),
        ('Sarvesh Hatiskar','Mumbai',9678543210,'sarvesh67@gmail.com'),
        ('Isha Joshi','Kalyan',9456789032,'isha1234@gmail.com'),
        ('Shivansh Thakur','Mulund',9554341229,'shivansh77@gmail.com'),
        ('Anika Sawant','Kurla',9675843567,'anika7890@gmail.com'),
        ('Gauri Palkar','Thane',8907655456,'gauri45@gmail.com');