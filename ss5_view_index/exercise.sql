create database demo;

use demo;

create table products(
id int auto_increment primary key,
product_code varchar(50),
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(50),
product_status bit
);

insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
value ('001', 'con meo', 100, 10, 'meo ngu', 1),
 ('002', 'con cho', 120, 5, 'cho oc cho', 1),
 ('003', 'con chuot', 20, 10, 'jerry', 1),
 ('004', 'con chim', 150, 30, 'chim gi do', 1),
 ('005', 'con bao', 1000, 1, 'bao doi bao dom', 1);
 
 create unique index product_index
 on products(product_code);
 
 create index composite_index
 on products(product_name, product_price);
 
 explain select*
 from products;
 
 create view products_view(product_code, product_name, product_price, product_status)
 as select product_code, product_name, product_price, product_status
 from products;
 
 update products_view
 set product_price = 1500
 where product_code = '005';
 
 select*
 from products_view;
 
 drop view products_view;
 
 delimiter //
 create procedure view_products()
 begin
 select*
 from products;
 end
 // delimiter ;
 
 call view_products();