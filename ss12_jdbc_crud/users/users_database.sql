create database demo;

use demo;

create table room(
id int auto_increment primary key,
room_name varchar(50) not null
);

create table users(
id int auto_increment primary key,
`name` varchar(50) not null,
email varchar(50) not null,
country varchar(50),
room_id int,
foreign key (room_id) references room(id)
);

insert into room (room_name)
values('phong binh thuong'), ('phong vip'), ('phong super vip');

insert into users(`name`, email, country, room_id)
values('vu1', 'vu1@gmail.com', 'VN',1),
('vu2', 'vu2@gmail.com', 'VN',2),
('vu3', 'vu3@gmail.com', 'VN',3),
('quoc', 'quoc@gmail.com', 'VN',1),
('tai', 'tai@gmail.com', 'VN',2),
('tai2', 'tai2@gmail.com', 'VN',3);

select*from users join room 
where room.id = users.room_id and room_id=room_id
and `name` like '%%';

delimiter //
create procedure show_users()
begin
select * from users;
end //
delimiter ;

Call show_users;
delimiter //

create procedure edit_users(
in idCheck int,
in name_user varchar(120),
in emails varchar(220),
in countrys varchar(120)
)

begin
update users set name_users = name_user,email= emails, country = countrys where id = idCheck;
end//
delimiter .
call edit_users(2,"thien","thien@codegym.vn","Viet Nam");
delimiter //

create procedure delete_users(
in id_check int
)
begin
delete from users where id = id_check;
end//
delimiter //
call delete_users(1);