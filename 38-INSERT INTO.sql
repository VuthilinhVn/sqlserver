USE NORTHWND;

--Câu lệnh thêm dữ liệu:
-- INSERT INTO table_name (column1, column 2,...)
-- VALUES (value 1, value 2, value 3,...)

-- Hoặc
-- INSERT INTO table_name
-- VALUES (value 1, value 2...) -- insert thông tin lần lượt từ trái sang phải
select * from dbo.Customers;

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Customers';

-- Thêm một khách hàng mới
INSERT INTO dbo.Customers (CustomerID, CompanyName, ContactName, ContactTitle, City, PostalCode, Country)
VALUES ('VLINH', 'Titv.VN', 'Vu Thi Linh', 'Sales Manager', 'Ha Noi', '25000', 'Viet Nam');

select * from dbo.Customers;

select column_name, data_type, character_maximum_length
from information_schema.columns
where table_name = 'Customers';

select column_name, data_type, character_maximum_length
from information_schema.columns
where table_name = 'Employees';