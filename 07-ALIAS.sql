-- Thay thế tên cho cột ALIAS
--  Viết câu lệnh SQL lấy “CompanyName” và đặt tên thay thế là “Công ty”; 
-- — “PostalCode” và đặt tên thay thế là “Mã bưu điện”
USE NORTHWND;

SELECT CompanyName AS [Tên công ty] FROM Customers;
SELECT CompanyName AS [Tên công ty], PostalCode AS [Mã bưu điện] FROM Customers;

-- Viết câu lệnh ra “LastName” và đặt tên thay thế là “Họ”; 
-- “FirstName” và đặt tên thay thế là “Tên”. Bảng Employees
SELECT LastName AS [Họ], FirstName AS [Tên] FROM Employees;

-- Viết câu lệnh SQL lấy ra 15 dòng đầu tiên tất cả các cột trong bảng Orders, đặt tên thay thế  cho bảng Orders là “o”.
SELECT TOP 15 [o].* FROM dbo.Orders AS o;

-- viết câu lệnh lấy ra 5 dong đầu tiên Products đặt tên là p, ProductName -> "Tên sp""
-- SupplierID -> Mã nhà cung cấp
-- CategoryID -> Mã loại
SELECT TOP 5 p.ProductName AS [tên sp], p.SupplierID AS [Mã nhà cung cấp], p.CategoryID AS [Mã loại]
FROM dbo.Products AS p;
