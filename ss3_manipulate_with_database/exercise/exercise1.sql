create database quan_li_sinh_vien;

use quan_li_sinh_vien;

create table class(
class_id int auto_increment primary key,
class_name varchar(60) not null,
start_date date,
status bit
);

create table student(
student_id int auto_increment primary key,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
class_id int not null,
foreign key (class_id) references class(class_id)
);

create table subject(
sub_id int auto_increment primary key,
sub_name varchar(30) not null,
credit tinyint not null default 1 check (credit >= 1),
status bit default 1
);

create table mark(
mark_id int auto_increment primary key,
sub_id int not null ,
foreign key (sub_id) references subject(sub_id),
student_id int not null ,
foreign key (student_id) references student(student_id),
unique (sub_id, student_id),
mark float default 0 check (mark>=0 and mark<=100),
exam_time tinyint default 1
);

insert into class(class_name, start_date, status)
value('A1', '2008-12-20',1),
('A2', '2008-12-22',1),
('B3', current_date,0);

insert into student(student_name, address, phone, status, class_id)
values('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai Phong', null, 1, 1),
('Manh', 'HCM', '0123123123', 0, 2);

insert into subject(sub_name, credit, status)
values ('CF', 5, 1),
('C', 6, 1),
('HDJ', 5, 1),
('RDBMS', 10, 1);

insert into mark(sub_id, student_id, mark, exam_time)
values (1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);

select *
from student
where student.student_name like 'H%';

select *
from class
where month(start_date)=12;

select *
from subject
where credit between 3 and 5;

-- da bat tat safe_updates
update student
set class_id = 2
where student_name = 'Hung';

select student_name, sub_name, mark
from student
join mark 
on student.student_id = mark.student_id
join subject
on subject.sub_id = mark.sub_id
order by mark DESC;


