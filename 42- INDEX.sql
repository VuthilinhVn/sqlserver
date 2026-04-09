-- INDEX TRONG CSDL

-- khi không có index câu query sẽ chạy lần lượt hết các row -> dữ liệu lớn -> performance thấp
-- index như một con trỏ, trở tới địa chỉ dữ liệu trong bảng, giống như mục lục trong sách vậy-> giúp query nhanh hơn
 
-- Bật hiển thị thống kê về tài nguyên
SET STATISTICS IO ON;

-- Thời gian làm việc với chuỗi lâu hơn so với thời gian làm việc với số
-- index tổ chức dưới dạng key-value
-- Tổ chức index gồm 2 loại hash index, k có thứ tự, chỉ là 1 chuỗi tương ứng với 1 key value
-- chỉ nên sử dụng trong các biểu thức toán tử là = và <> hay order by thì k sử dụng đc
-- kiểu thứ 2 là btree: tổ chức dạng tree: root node đứng vị trí cao nhất , child node, parent node, leaf node
-- internal node là tất cả các node kp lá
-- external node là tất cả các node lá
-- Btree được  sử dụng trong các biểu thức so sánh dạng: =, >, >=, <, <=, BETWEEN, LIKE.
-- Btree index được sử dụng cho những column trong bảng khi muốn tìm kiếm 1 giá trị nằm trong khoảng nào đó.

-- Hash có tốc độ nhanh hơn kiểu Btree.

-- Cú pháp:
-- CREATE INDEX index_name
-- ON table_name(column 1, column 2...)
-- Hoặc:
-- CREATE UNIQUE INDEX index_name
--ON table_name (column 1, column 2...)

select column_name
from information_schema.columns
where table_name = 'Customers';


-- Các TH nên đánh index: 
-- (1) Bảng dữ liệu trên 100 nghìn dòng, dữ liệu string.
-- (2) Các column thường xuyên sử dụng mệnh đề where, join và order by
-- Các TH k nên đánh index:
-- (1) CSDL nhỏ, sd tài nguyên ít
-- (2) Dữ liệu thay đổi thường xuyên
-- (3) Cột chứa dữ liệu k đa dạng
-- (4) Cột dữ liệu text quá dài, vd description
--- Các trường tự đánh index:
-- (1) Primary key
-- (2) Foreign key
-- (3) Cột Unique

USE AdventureWorks2025;
select table_name
from information_schema.tables;

-- Bật hiển thị thống kê về tài nguyên
SET STATISTICS IO ON;
select COUNT(*) from Sales.SalesOrderDetail;

EXEC sp_help 'Sales.SalesOrderDetail';


-- Thống kê orderdatail
select *
from Sales.SalesOrderDetail
where CarrierTrackingNumber = '1B2B-492F-A9'; --Logical reads 1241

SET STATISTICS IO OFF;

-- Tạo index cho CarrierTrackingNumber
CREATE INDEX idx_CarrierTrackingNumber ON Sales.SalesOrderDetail (CarrierTrackingNumber);
-- check lại 
SET STATISTICS IO ON;

select *
from Sales.SalesOrderDetail
where CarrierTrackingNumber = '1B2B-492F-A9';  -- logical reads 69

SET STATISTICS IO OFF;



