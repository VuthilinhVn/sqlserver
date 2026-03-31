--Tạo table
-- CREATE TABLE table_name (
-- [tên cột] [kiểu dữ liệu] [khóa chính] [khóa ngoại] [số lượng ký t] [null]...
USE NVDB;
--Tạo table nhân viên
CREATE TABLE Nhanvien (
	MaNV int not null primary key ,
	HoTen varchar(50) not null,
	Phai varchar(10),
	NgaySinh date,
	DiaChi varchar(255),
	sdt varchar(10)
);

-- Tao Table khach hang
create table KhachHang (
	MaKH int identity(100,5) not null primary key,
	TenKH varchar(50) not null,
	DiaChi varchar(255),
	sdt varchar(10) check (sdt like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

-- Ở trong mysql thì dùng:
create table KhachHang (
	MaKH int identity(100,5) not null primary key,
	TenKH varchar(50) not null,
	DiaChi varchar(255),
	sdt varchar(10) check (sdt regexp '^[0-9]{10}$')
);

-- ALTER = thay đổi cấu trúc bảng đã có
-- Thêm cột
ALTER TABLE Nhanvien 
ADD Email varchar(100);

-- sửa KIỂU DỮ LIỆU cột
ALTER TABLE Nhanvien
ALTER COLUMN Email varchar(200);
-- Mysql
alter table Nhanvien
modify Email varchar(200);

-- xóa cột
Alter table Nhanvien
drop column Email;

-- Thêm primary key
alter table Nhanvien
add primary key (ten_column);

alter table KhachHang
add MaNV int not null;

-- thêm foreign key
alter table KhachHang
add constraint fk_nv
foreign key (MaNV)
references Nhanvien(MaNV);

ALTER TABLE Nhanvien
ADD CONSTRAINT NgaySinh CHECK (NgaySinh < GETDATE());


-- xóa bảng
DROP TABLE tên_table;

TRUNCATE TABLE tên_table; -- xóa dữ liệu trong bảng, nhưng cấu trúc bảng dữ nguyên


-- BTVN
CREATE TABLE SinhVien (
	MaSV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTB FLOAT
);

ALTER TABLE SinhVien
ADD Email VARCHAR(100);

ALTER TABLE SinhVien
ALTER COLUMN DiemTB DECIMAL(2,1);

ALTER TABLE SinhVien
DROP COLUMN Nganh;

ALTER TABLE SinhVien
ADD CONSTRAINT DiemTB CHECK (DiemTB >= 0);

ALTER TABLE SinhVien
ADD CONSTRAINT UQ_SinhVien_MaSV UNIQUE(MaSV);








