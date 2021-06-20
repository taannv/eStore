create database eStore;
--use master
--drop database eStore
go
use eStore
go
create table Categories(
	cid int primary key identity,
	cname varchar(50),
	status bit
);
go
create table products(
	pid int primary key identity,
	pname nvarchar(200),
	unitprice float,
	image varchar(100),
	createdate Date,
	status bit,
	cid int foreign key references Categories(cid),
	quantity int,
	description nvarchar(200),
	discount float,
	viewcount int,
	specical bit
);
go
create table Customers(
	cusid varchar(20) primary key,
	password varchar(36),
	fullname nvarchar(50),
	email varchar(50),
	photo varchar(100),
	status bit,
	admin bit
);
go
create table Orders(
	oid int primary key identity,
	cusid varchar(20) foreign key references Customers(cusid),
	createdate Date,
	address nvarchar(100),
	amount int,
	description nvarchar(200)
);
go
create table OrderDetails(
	odid int primary key identity,
	oid int foreign key references Orders(oid),
	pid int foreign key references products(pid),
	unitprice float,
	quantity int,
	discount float
)
