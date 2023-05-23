create database internet_management;

use internet_management;

create table loai_may_tinh(
ma_loai_may_tinh int auto_increment primary key,
ten_loai_may_tinh varchar(50),
gia_tien double
);

create table may_tinh(
ma_may_tinh int auto_increment primary key,
hang_san_xuat varchar(50) not null,
vi_tri varchar(5) not null unique,
ma_loai_may_tinh int,
foreign key (ma_loai_may_tinh) references loai_may_tinh(ma_loai_may_tinh)
);

create table loai_khach_hang(
ma_loai_khach_hang int auto_increment primary key,
ten_loai_khach_hang varchar(50)
);

create table khach_hang(
ma_khach_hang int auto_increment primary key,
can_cuoc_cong_dan varchar(12),
ho_ten varchar(50),
so_dien_thoai varchar(12),
email varchar(50),
ma_loai_khach_hang int,
foreign key (ma_loai_khach_hang) references loai_khach_hang(ma_loai_khach_hang)
);

create table dich_vu_di_kem(
ma_dich_vu_di_kem int auto_increment primary key,
ten_dich_vu_di_kem varchar(50),
gia double
);

create table dich_vu(
ma_dich_vu int auto_increment primary key,
ma_khach_hang int,
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
ma_may_tinh int,
foreign key (ma_may_tinh) references may_tinh(ma_may_tinh),
thoi_gian_bat_dau datetime,
thoi_gian_ket_thuc datetime
);

create table dich_vu_di_kem_chi_tiet(
ma_dich_vu int,
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu),
ma_dich_vu_di_kem int,
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
primary key (ma_dich_vu, ma_dich_vu_di_kem),
so_luong int
)