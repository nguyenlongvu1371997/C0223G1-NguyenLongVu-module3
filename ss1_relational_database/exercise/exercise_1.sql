create database ss1;
use ss1;

create table class(
id int primary key,
`name` varchar(45)
);

insert into class value (1,"C0223G1");
insert into class value (2,"C0323G1");
insert into class value (3,"C0423G1");
insert into class value (4,"C0523G1");

create table teacher(
id int primary key,
`name` varchar(45),
age int,
country varchar(45)
);

insert into teacher value (1,"Vu",26,"Viet Nam");