create database FSMS;
use FSMS;
create table admin1(Username varchar(20) not null , Password varchar(10) not null);
create table Customer(cust_id int primary key auto_increment,cust_name varchar(30) not null,
	cust_address varchar(50) not null,contact_no bigint not null,email_id varchar(20) not null unique);
create table Product(Pid int primary key,PName varchar(20) not null,PCategory varchar(20) not null,
	Price int not null);