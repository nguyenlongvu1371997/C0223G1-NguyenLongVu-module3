create database furama_resort;
use furama_resort;

create table vi_tri(
ma_vi_tri int auto_increment primary key,
ten_vi_tri varchar(45)
);

create table trinh_do(
ma_trinh_do int auto_increment primary key,
ten_trinh_do varchar(45)
);

create table bo_phan(
ma_bo_phan int auto_increment primary key,
ten_bo_phan varchar(45)
);

create table nhan_vien(
ma_nhan_vien int auto_increment primary key,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
ma_trinh_do int,
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
ma_bo_phan int,
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);

create table loai_khach(
ma_loai_khach int auto_increment primary key,
ten_loai_khach varchar(45)
);

create table khach_hang(
ma_khach_hang int auto_increment primary key,
ma_loai_khach int,
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach),
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);

create table loai_dich_vu(
ma_loai_dich_vu int auto_increment primary key,
ten_loai_dich_vu varchar(45)
);

create table kieu_thue(
ma_kieu_thue int auto_increment primary key,
ten_kieu_thue varchar(45)
);

create table dich_vu(
ma_dich_vu int auto_increment primary key,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
ma_loai_dich_vu int,
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int
);

create table hop_dong(
ma_hop_dong int auto_increment primary key,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
ma_khach_hang int,
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
ma_dich_vu int,
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);

create table dich_vu_di_kem(
ma_dich_vu_di_kem int auto_increment primary key,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(45) not null,
trang_thai varchar(45)
);

create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int auto_increment primary key,
ma_hop_dong int,
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
ma_dich_vu_di_kem int,
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong int not null
);

insert into vi_tri(ten_vi_tri)
value("Quản Lí"), ("Nhân Viên");

insert into trinh_do(ten_trinh_do)
value("Trung Cấp"), ("Cao Đẳng"), ("Đại Học"), ("Sau Đại Học");

insert into bo_phan(ten_bo_phan)
value("Sale-Marketing"), ("Hành chính"), ("Phục vụ"), ("Quản lý");

insert into nhan_vien(ho_ten,ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
value("Nguyễn Văn An",'1970-11-07', "456231786", 10000000, "0901234121", "annguyen@gmail.com", "295 Nguyễn Tất Thành, Đà Nẵng", 1, 3, 1),
("Lê Văn Bình",'1997-04-09', "654231234", 7000000, "0934212314", "binhlv@gmail.com", "22 Yên Bái, Đà Nẵng", 1, 2, 2),
("Hồ Thị Yến",'1995-12-12', "999231723", 14000000, "0412352315", "thiyen@gmail.com", "K234/11 Điện Biên Phủ, Gia Lai", 1, 3, 2),
("Võ Công Toản",'1980-04-04', "123231365", 17000000, "0374443232", "toan0404@gmail.com", "77 Hoàng Diệu, Quảng Trị", 1, 4, 4),
("Nguyễn Bỉnh Phát",'1999-12-09', "454363232", 6000000, "0902341231", "phatphat@gmail.com", "43 Yên Bái, Đà Nẵng", 2, 1, 1),
("Khúc Nguyễn An Nghi", '2000-11-08', "964542311", 7000000, "0978653213", "annghi20@gmail.com", "294 Nguyễn Tất Thành, Đà Nẵng", 2, 2, 3),
("Nguyễn Hữu Hà",'1993-01-01', "534323231", 8000000, "0941234553", "nhh0101@gmail.com", "4 Nguyễn Chí Thanh, Huế", 2, 3, 2),
("Nguyễn Hà Đông",'1989-09-03', "234414123", 9000000, "0642123111", "donghanguyen@gmail.com", "111 Hùng Vương, Hà Nội", 2, 4, 4),
("Tòng Hoang",'1982-09-03', "256781231", 6000000, "0245144444", "hoangtong@gmail.com", "213 Hàm Nghi, Đà Nẵng", 2, 4, 4),
("Nguyễn Công Đạo",'1994-01-08', "755434343", 8000000, "0988767111", "nguyencongdao12@gmail.com", "6 Hoà Khánh, Đồng Nai", 2, 3, 2);

insert into loai_khach(ten_loai_khach)
value("Diamond"),("Platinium"),("Gold"),("Silver"),("Member");

insert into khach_hang(ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)
value("Nguyễn Thị Hào", '1970-11-07', 0, "643431213", "0945423362", "thihao07@gmail.com", "23 Nguyễn Hoàng, Đà Nẵng", 5),
("Phạm Xuân Diệu", '1992-08-08', 1, "865342123", "0954333333", "xuandieu92@gmail.com", "K77/22 Thái Phiên, Quảng Trị", 3),
("Trương Đình Nghệ", '1990-02-27', 1, "488645199", "0373213122", "nghenhan2702@gmail.com", "K323/12 Ông Ích Khiêm, Vinh", 1),
("Dương Văn Quan", '1981-07-08', 1, "543432111", "0490039241", "duongquan@gmail.com", "K453/12 Lê Lợi, Đà Nẵng", 1),
("Hoàng Trần Nhi Nhi", '1995-12-09', 0, "795453345", "0312345678", "nhinhi123@gmail.com", "224 Lý Thái Tổ, Gia Lai", 4),
("Tôn Nữ Mộc Châu", '2005-12-06', 0, "732434215", "0988888844", "tonnuchau@gmail.com", "37 Yên Thế, Đà Nẵng", 4),
("Nguyễn Mỹ Kim", '1984-04-08', 0, "856453123", "0912345698", "kimcuong84@gmail.com", "K123/45 Lê Lợi, Hồ Chí Minh", 1),
("Nguyễn Thị Hào", '1999-04-08', 0, "965656433", "0763212345", "haohao99@gmail.com", "55 Nguyễn Văn Linh, Kon Tum", 3),
("Trần Đại Danh", '1994-07-01', 1, "432341235", "0643343433", "danhhai99@gmail.com", "24 Lý Thường Kiệt, Quảng Ngãi", 1),
("Nguyễn Tâm Đắc", '1989-07-01', 1, "344343432", "0987654321", "dactam@gmail.com", "22 Ngô Quyền, Đà Nẵng", 2);

insert into kieu_thue(ten_kieu_thue)
value("year"), ("month"), ("day"), ("hour");

insert into loai_dich_vu(ten_loai_dich_vu)
value("Villa"), ("House"), ("Room");

insert into dich_vu(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu)
value("Villa Beach Front", 25000, 10000000, 10, "vip", "Có hồ bơi", 500, 4, 3, 1),
("House Princess 01", 14000, 5000000, 7, "vip", "Có thêm bếp nướng", null, 3, 2, 2),
("Room Twin ", 5000, 1000000, 2, "normal", "Có tivi", null, null, 4, 3),
("Villa No Beach Front", 22000, 9000000, 8, "normal", "Có hồ bơi", 300, 3, 3, 1),
("House Princess 02", 10000, 4000000, 5, "normal", "Có thêm bếp nướng", null, 2, 3, 2),
("Room Twin 02", 3000, 900000, 2, "normal", "Có tivi", null, null, 4, 3);

insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
value("Karaoke", 10000, "giờ", "tiện nghi, hiện tại"),
("Thuê xe máy", 10000, "chiếc", "hỏng 1 xe"),
("Thuê xe đạp", 20000, "chiếc", "tốt"),
("Buffet buổi sáng", 15000, "suất", "đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi trưa", 90000, "suất", "đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi tối", 16000, "suất", "đầy đủ đồ ăn, tráng miệng");

insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
value('2020-12-08', '2020-12-08', 0, 3, 1, 3),
('2020-07-14', '2020-07-21', 200000, 7, 3, 1),
('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
('2021-01-14', '2021-01-18', 100000, 7, 5, 5),
('2021-07-14', '2021-07-15', 0, 7, 2, 6),
('2021-06-01', '2021-06-03', 0, 7, 7, 6),
('2021-09-02', '2021-09-05', 100000, 7, 4, 4),
('2021-06-17', '2021-06-18', 150000, 3, 4, 1),
('2020-11-19', '2020-11-19', 0, 3, 4, 3),
('2021-04-12', '2021-04-14', 0, 10, 3, 5),
('2021-04-25', '2021-04-25', 0, 2, 2, 1),
('2021-05-25', '2021-05-27', 0, 7, 10, 1);

insert into hop_dong_chi_tiet(so_luong, ma_hop_dong, ma_dich_vu_di_kem)
value(5, 2, 4),
(8, 2, 5),
(15, 2, 6),
(1, 3, 1),
(11, 3, 2),
(1, 1, 3),
(2, 1, 2),
(2, 12, 2);

-- câu 2
select*
from nhan_vien
where (substring_index(nhan_vien.ho_ten," ",-1) like 'H%'
or substring_index(nhan_vien.ho_ten," ",-1) like 'T%'
or substring_index(nhan_vien.ho_ten," ",-1) like 'K%')
and character_length(replace(nhan_vien.ho_ten,' ',''))<=15;

-- câu 3
select *
from khach_hang
where timestampdiff(year, khach_hang.ngay_sinh, curdate()) >= 18
&& timestampdiff(year, khach_hang.ngay_sinh, curdate()) <= 50
&& (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');

-- câu 4
select khach_hang.ho_ten,count(khach_hang.ho_ten) as 'so lan dat phong'
from khach_hang
join loai_khach
on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
join hop_dong
on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where ten_loai_khach = 'Diamond'
group by khach_hang.ho_ten;

-- câu 5
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, dich_vu.ten_dich_vu,
 ngay_lam_hop_dong, ngay_ket_thuc
 from khach_hang
 join loai_khach
 on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
 left join hop_dong
 on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
 left join dich_vu
 on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
 left join hop_dong_chi_tiet
 on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
 left join dich_vu_di_kem
 on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 order by khach_hang.ma_khach_hang;
 
 -- Hiển thị dịch vụ được đặt trong quý 1 năm 2021
 select dich_vu.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
 from dich_vu
 join loai_dich_vu
 on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
 left join hop_dong 
 on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
 where (hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31')
 or (hop_dong.ngay_ket_thuc between '2021-01-01' and '2021-03-31')
 or (hop_dong.ngay_lam_hop_dong<'2021-01-01' and hop_dong.ngay_ket_thuc>'2021-03-31')
 group by dich_vu.ma_dich_vu;
 
-- câu 6: hiển thị dịch vụ không đặt trong quý 1 năm 2021
 select dich_vu.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
 from dich_vu
 join loai_dich_vu
 on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
 left join hop_dong 
 on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
 where dich_vu.ma_dich_vu not in (
 select dich_vu.ma_dich_vu
 from dich_vu
 left join hop_dong 
 on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
 where (hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31')
 or (hop_dong.ngay_ket_thuc between '2021-01-01' and '2021-03-31')
 or (hop_dong.ngay_lam_hop_dong<'2021-01-01' and hop_dong.ngay_ket_thuc>'2021-03-31')
 )
 group by dich_vu.ma_dich_vu;
 
 -- câu 7
 select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
 from dich_vu dv
 join loai_dich_vu ldv
 on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 join hop_dong hd
 on hd.ma_dich_vu = dv.ma_dich_vu
 where dv.ma_dich_vu not in(
 select dv.ma_dich_vu
 from  dich_vu dv
 join hop_dong hd
 on dv.ma_dich_vu = hd.ma_dich_vu
 where year(hd.ngay_lam_hop_dong) = 2021
 group by dv.ma_dich_vu) 
 && year(hd.ngay_lam_hop_dong) = 2020
group by dv.ma_dich_vu;

-- câu 8: cách 1
select kh.ho_ten
from khach_hang kh
group by kh.ho_ten;

-- câu 8: cách 2
select distinct kh.ho_ten
from khach_hang kh;

-- câu 8: cách 3
select kh.ho_ten
from khach_hang kh
union
select kh.ho_ten
from khach_hang kh;

-- câu 9
select month(hd.ngay_lam_hop_dong) as 'thang', count(hd.ma_hop_dong)
from hop_dong hd
where year(hd.ngay_lam_hop_dong)=2021
group by month(hd.ngay_lam_hop_dong)
order by month(hd.ngay_lam_hop_dong);

-- câu 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hdct.so_luong),0)
from hop_dong hd
left join hop_dong_chi_tiet hdct
on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong
order by hd.ma_hop_dong;

-- câu 11
select kh.ho_ten,dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from khach_hang kh
join loai_khach lk
on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd
on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet hdct
on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where lk.ten_loai_khach='Diamond'
and (kh.dia_chi like '%Vinh' or kh.dia_chi like '%Quảng Ngãi');

-- câu 12
	select hd.ma_hop_dong,nv.ho_ten, kh.ho_ten, dv.ten_dich_vu,kh.so_dien_thoai, ifnull(sum(hdct.so_luong),0), hd.tien_dat_coc
	from hop_dong hd
    join nhan_vien nv
    on hd.ma_nhan_vien = nv.ma_nhan_vien
	join khach_hang kh
	on hd.ma_khach_hang = kh.ma_khach_hang
	join dich_vu dv
	on hd.ma_dich_vu = dv.ma_dich_vu
	left join hop_dong_chi_tiet hdct
	on hdct.ma_hop_dong = hd.ma_hop_dong
    where dv.ma_dich_vu not in(
    select dv.ma_dich_vu
    from dich_vu dv
    join hop_dong hd
    on dv.ma_dich_vu = hd.ma_dich_vu
    where year(hd.ngay_lam_hop_dong) = 2021
    and month(hd.ngay_lam_hop_dong) between 1 and 6
    ) and dv.ma_dich_vu in (
    select dv.ma_dich_vu
    from dich_vu dv
    join hop_dong hd
    on dv.ma_dich_vu = hd.ma_dich_vu
    where year(hd.ngay_lam_hop_dong) = 2020
    and month(hd.ngay_lam_hop_dong) between 10 and 12
    )
	group by hd.ma_hop_dong;
    
-- câu 13
select dvdk.*
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong) = (
select sum(hdct.so_luong)
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
order by sum(hdct.so_luong) desc
limit 1
);

-- câu 14
select hdct.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ten_dich_vu_di_kem)
from hop_dong hd
join dich_vu dv
on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv
on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong_chi_tiet hdct
on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where dvdk.ma_dich_vu_di_kem in (
select dvdk.ma_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd
on hdct.ma_hop_dong = hd.ma_hop_dong
group by dvdk.ma_dich_vu_di_kem
having count(dvdk.ma_dich_vu_di_kem) = 1
) 
group by hdct.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem
order by hdct.ma_hop_dong;

-- câu 15
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
join trinh_do td
on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp
on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong hd
on hd.ma_nhan_vien = nv.ma_nhan_vien
where year(hd.ngay_lam_hop_dong)=2020
or year(hd.ngay_lam_hop_dong)=2021
group by nv.ma_nhan_vien
having count(nv.ma_nhan_vien) <=3;

-- câu 16
set sql_safe_updates = 0;

delete
from nhan_vien nv
where nv.ma_nhan_vien not in(
select *
from(
select nv.ma_nhan_vien
from nhan_vien nv
join hop_dong hd
on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2019 and 2021
group by nv.ma_nhan_vien
) as t
);

set sql_safe_updates = 1;

-- câu 17
set sql_safe_updates = 0;

update khach_hang
set ma_loai_khach = 1
where ma_loai_khach = 2 
and ma_khach_hang in (
select *
from (
select kh.ma_khach_hang
from khach_hang kh
join hop_dong hd
on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv
on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct
on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
having sum(dv.chi_phi_thue) + sum(ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia,0)) > 10000000
) as t
);

-- câu 18
alter table khach_hang
add status bit default 1;

update khach_hang
set status = 0 
where khach_hang.ma_khach_hang in (
select *
from (
select kh.ma_khach_hang
from khach_hang kh
join hop_dong hd
on hd.ma_khach_hang = kh.ma_khach_hang
where year(hd.ngay_lam_hop_dong) < 2021
) as t
);

-- câu 19
update dich_vu_di_kem
set gia = gia*2
where dich_vu_di_kem.ma_dich_vu_di_kem in (
select *
from (
select dvdk.ma_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd
on hd.ma_hop_dong = hdct.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = 2020
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong) > 10
) as t
);

-- câu 20
select nv.ma_nhan_vien as 'ma', nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien nv
union
select kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
from khach_hang kh;

-- câu 21 
 create view v_nhan_vien (ma_nhan_vien, ho_ten,ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
 as select nv.ma_nhan_vien, nv.ho_ten, nv.ngay_sinh, nv.so_cmnd, nv.luong, nv.so_dien_thoai, nv.email, nv.dia_chi, nv.ma_vi_tri, nv.ma_trinh_do, nv.ma_bo_phan
 from nhan_vien nv
 join hop_dong hd
 on hd.ma_nhan_vien = nv.ma_nhan_vien
 where hd.ngay_lam_hop_dong = '2020-07-14';
 
 select *
 from v_nhan_vien;

--  câu 22
set sql_safe_updates = 0;

update v_nhan_vien
set dia_chi = 'liên chiểu';

set sql_safe_updates = 1;

-- câu 23
delimiter //
create procedure sp_xoa_khach_hang(ma_khach_hang int) 
begin
delete
from khach_hang kh
where kh.ma_khach_hang = ma_khach_hang;
end //
delimiter ;

call sp_xoa_khach_hang(6);

select *
from khach_hang;

-- câu 24
