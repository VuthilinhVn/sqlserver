-- SELECT TOP
--Cú pháp 
-- SELECT TOP (number)| PERCENT column name
--FROM table
-- WHERE condition (tạm thời chưa học)

USE NORTHWND;
-- Viết câu lệnh SQL lấy ra 05 dòng đầu tiên trong bảng Customers.

SELECT TOP 5 * FROM Customers;
SELECT TOP 5 CompanyName, ContactName FROM Customers;

-- Viết câu lệnh SQL lấy ra 30% nhân viên (30% bảng ở từ đầu xuống)  của công ty hiện tại.
SELECT TOP 30 PERCENT * FROM Employees;
SELECT TOP 30 PERCENT LastName, FirstName FROM Employees;
SELECT TOP 100 PERCENT * FROM Employees;

-- Viết câu lệnh SQL lấy ra các mã khách hàng trong bảng đơn hàng 
-- với quy định là mã khách hàng không được trùng lặp, 
-- chỉ lấy 5 dòng dữ liệu đầu tiên.
SELECT DISTINCT TOP 5 CustomerID FROM Orders;
SELECT DISTINCT CustomerID FROM Orders;

-- Viêt câu lệnh SQL lấy ra các sản phẩm không có mã trùn lặp và chỉ lấy 3 dong đầu tiên
SELECT DISTINCT TOP 3 CategoryID FROM Products;