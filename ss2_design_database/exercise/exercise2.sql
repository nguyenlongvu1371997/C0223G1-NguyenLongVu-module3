create database quan_li_ban_hang;
use quan_li_ban_hang;

create table customer(
c_id int auto_increment primary key,
c_name varchar(50),
c_age int 
);

create table `order`(
o_id int auto_increment primary key,
c_id int,
foreign key (c_id) references customer(c_id),
o_date date,
o_total_price double
);

create table product(
p_id int auto_increment primary key,
p_name varchar(50),
p_price double
);

create table order_detail(
o_id int,
p_id int,
primary key(o_id, p_id),
od_qty varchar(45),
foreign key (o_id) references `order`(o_id),
foreign key (p_id) references product(p_id)
);

insert into customer(c_name, c_age)
value('Minh Quan',10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

insert into `order`(c_id, o_date, o_total_price)
value(1,'2006-03-21',null),
(2,'2006-03-23',null),
(1,'2006-03-16',null);

insert into product(p_name, p_price)
value('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

insert into order_detail(o_id, p_id, od_qty)
value(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

select *
from `order`;

select c_name, p_name
from customer
join `order`
join order_detail
join product
on customer.c_id=`order`.c_id 
&& `order`.o_id = order_detail.o_id
&& order_detail.p_id = product.p_id
order by c_name;

select c_name
from customer
join `order`
on customer.c_id=`order`.c_id
group by c_name;

select p_name
from product
join order_detail
on product.p_id=order_detail.p_id
group by p_name;

select c_name
from customer
left join `order`
on customer.c_id = `order`.c_id
where `order`.c_id is null;

select `order`.o_id, o_date, sum(order_detail.od_qty*product.p_price) as o_total_price
from `order`
join order_detail
on `order`.o_id = order_detail.o_id
join product  
on order_detail.p_id = product.p_id
group by `order`.o_id;



