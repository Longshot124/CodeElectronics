create database CodeElectronics

use CodeElectronics

create table Notebooks(
Id int primary key identity,
[Name] nvarchar(20) not null,
Price int
)

alter table Notebooks
add constraint DF_Price default 200 for Price

create table Brands(
Id int primary key identity,
[Name] nvarchar(30)
)

alter table Brands
add constraint CK_Name check(Len([Name])>3)

insert into Brands([Name])
values('Apple'),
('Lenovo'),
('Acer'),
('Dell'),
('Khazar')

insert into Notebooks([Name],Price)
values('Macbook',3000),
('Legion',2000),
('Razon',2300),
('Predator',3200),
('D500',459),
('Phoenix',850)


alter table Notebooks
add Brand_Id int foreign key references Brands (Id)

select Notebooks.[Name],Brands.[Name],Notebooks.Price from Notebooks
join Brands
on Notebooks.Brand_Id=Brands.Id

select Brands.[Name] from Brands where Brands.[Name] like '%a%'

select * from Notebooks where Price between 100 and 500 or Price>1000