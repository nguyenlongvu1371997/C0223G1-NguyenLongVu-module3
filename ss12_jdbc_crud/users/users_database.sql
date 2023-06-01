create database demo;

use demo;

create table users(
id int(3) auto_increment primary key,
`name` varchar(50) not null,
email varchar(50) not null,
country varchar(50)
);

insert into users(`name`, email, country)
values('vu1', 'vu1@gmail.com', 'VN'),
('vu2', 'vu2@gmail.com', 'VN'),
('vu3', 'vu3@gmail.com', 'VN');