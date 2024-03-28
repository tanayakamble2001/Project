	-- create database
create database FSMS;
	-- select database
use FSMS;
show tables;
	-- create customer table
create table Customer(cust_id int primary key auto_increment,cust_name varchar(30) not null,
		cust_address varchar(50) not null,contact_no bigint not null,email_id varchar(20) not null unique);
desc Customer;
	-- create product table
create table Product(Prod_id int primary key,PName varchar(20) not null,PCategory varchar(20) not null,
		Price int not null);
desc Product;
	-- create replacement product table
create table Replace_Product(Replace_id int primary key,Category varchar(20) not null,
		RePrice int not null);
desc Replace_Product;
	-- create shop cart table
create table Shopcart(ScId int primary key, cust_id int,Prod_id int ,Replace_id int,Quantity int not null,foreign key(Prod_id) references Product(Prod_id),
					foreign key(cust_id) references Customer(cust_id),foreign key(Replace_id) references Replace_Product(Replace_id));
desc Shopcart;
	-- create payment table
create table Payment(Pay_id int primary key,Pay_Category varchar(20) not null);
desc Payment;
	-- create order table
create table Order1(Order_id int primary key,cust_id int,ScId int,Pay_id int, OrderDate date not null, 
		foreign key(cust_id) references Customer(cust_id),foreign key(ScId) references Shopcart(ScId),
        foreign key(Pay_id) references Payment(Pay_id));
desc order1;
        
	-- insert value in customer table
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
        
	-- insert values in product table
insert into Product values(1,'King Bed','Bed',30000),(2,'Office Chair','Chair',19990),
		(3,'Dining Table Set','Dining Furniture',25000),(4,'Sliding door','Wardrobes',35000),
        (5,'Sofa Cum Bed','Sofas',39990),(6,'Bookcase with drawer','Bookcases units',6490),
        (7,'Coffee table','Tables',2690),(8,'Mirrored wardrobes','Wardrobes',20000),
        (9,'Wall shelf','Shelving units',8660),(10,'3-seat sofa','Sofas',20990);
select * from Product;

	-- insert value in replace product table
insert into Replace_Product values(1,'Bed',5000),(2,'Chair',2000),(3,'Sofas',4000),(4,'Bookcases unit',1000),
		(5,'Tables',500),(6,'Shelving unit',1000),(7,'Dining furniture',3000),(8,'Wardrobes',5000),
        (9,'Swing Chairs',500),(10,'TV Unit',800);
select * from Replace_Product;

	-- insert value in Shopcart table
insert into Shopcart(Scid,cust_id,Prod_id,Replace_id,Quantity) values(1,5,6,4,1),(2,7,9,null,3),(3,2,4,8,1),
		(4,10,1,3,1),(5,4,7,null,2),(6,1,5,3,1),(7,2,6,4,2),(8,4,10,null,1),(9,1,3,7,1),(10,6,2,null,4);
select * from Shopcart;

	-- insert value in Payment table
insert into Payment values(101,'Cash On Delivery'),(102,'Debit Card'),(103,'Credit Card'),(104,'Cheque'),(105,'Net Banking');
select * from Payment;

	-- insert value in order table
insert into Order1 values(1,2,3,101,'2023-08-18'),(2,4,8,103,'2023-09-01'),(3,9,null,104,'2023-09-20'),
		(4,10,4,102,'2023-10-18'),(5,1,6,101,'2023-11-28'),(6,7,2,105,'2023-12-31'),(7,2,7,104,'2024-01-01'),
        (8,1,9,102,'2024-01-26'),(9,5,1,103,'2024-02-01'),(10,6,10,105,'2024-03-08');
select * from Order1;

	-- subquery
select  cust_id,cust_name as Customer_Name from Customer where cust_id  NOT IN (select cust_id from Order1);

	-- join display customer who have replace the product
-- select s.ScId,c.cust_name as Customer_name,p.PName as Product_Name,r.Category as Replace_Product,p.Price,r.RePrice,s.Quantity,(p.Price-r.RePrice)*Quantity as Total_amount  from Customer as c inner join Shopcart as s on c.cust_id=s.cust_id inner join Replace_Product as r on r.Replace_id=s.Replace_id inner join Product as p on p.Prod_id=s.Prod_id;
	-- disaplay Shopcart details 
select s.Scid,c.cust_name as Customer_Name,p.Pname as Product_Name,r.Category,p.Price,r.Reprice,s.Quantity,
(p.Price-r.Reprice)*s.Quantity as Total_amount from Customer as c 
inner join Shopcart as s on c.cust_id=s.cust_id 
inner join Product as p on p.Prod_id=s.Prod_id 
inner join Replace_Product as r on r.Replace_id=s.Replace_id;

	 -- display Customer who pay with Debit card
select Order_id,cust_name as Customer_Name,Pay_Category from Customer natural join Order1
natural join Payment where Pay_Category='Debit Card';
	-- customer not replace the product
select ScId,cust_name as Customer_Name from Customer natural join Shopcart where Replace_id is null;