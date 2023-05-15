create database lesson2_exercise1;
use lesson2_exercise1;

create table phieu_xuat(
so_px int auto_increment primary key,
ngay_xuat date not null
);

create table vat_tu(
ma_vt int auto_increment primary key,
ten_vt varchar(50) not null
);

create table chi_tiet_phieu_xuat(
so_px int,
foreign key (so_px) references phieu_xuat(so_px),
ma_vt int,
foreign key (ma_vt) references vat_tu(ma_vt),
don_gia_xuat double,
so_luong_xuat int
);


create table nha_cung_cap(
ma_nha_cc int auto_increment primary key,
ten_nha_cc varchar(50) not null,
dia_chi varchar(50)
);
create table so_dien_thoai(
ma_nha_cc int,
foreign key (ma_nha_cc) references nha_cung_cap(ma_nha_cc),
sdt_1 varchar(13)
);


create table don_dat_hang(
so_dat_hang int auto_increment primary key,
ma_nha_cc int,
foreign key (ma_nha_cc) references nha_cung_cap(ma_nha_cc),
ngay_dat_hang date
);

create table chi_tiet_don_dat_hang(
ma_vt int,
foreign key (ma_vt) references vat_tu(ma_vt),
so_dat_hang int,
foreign key (so_dat_hang) references don_dat_hang(so_dat_hang)
);

create table phieu_nhap(
so_pn int auto_increment primary key,
ngay_nhap date
);

create table chi_tiep_phieu_nhap(
ma_vt int,
foreign key (ma_vt) references vat_tu(ma_vt),
so_pn int,
foreign key (so_pn) references phieu_nhap(so_pn),
don_gia_nhap double,
so_luong_nhap int
);
