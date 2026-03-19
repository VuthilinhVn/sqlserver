-- lọc dự liệu trong danh sách bằng IN hoặc NOT IN
USE NORTHWND;

-- IN (value 1, value 2, value 3,...) đúng 1 trong các giá trị thì sẽ lấy ra
--NOT IN (value 1, value 2,...) k có tất cả giá trị trong danh sách

-- Hãy lọc ra tất cả các đơn hàng với điều kiện: a, Đơn hàng được giao đến Germany, UK, Brazil
SELECT * FROM dbo.Orders WHERE ShipCountry IN ('Germany','UK','Brazil');

-- Đơn hàng được giao đến các quốc gia khác Germany, UK, Brazil
SELECT * FROM dbo.Orders WHERE ShipCountry NOT IN ('Germany','UK','Brazil');

-- Lấy ra các sản phẩm có mã thể loại khác với 2, 3 và 4.
SELECT * FROM dbo.Products WHERE CategoryID NOT IN (2, 3, 4)
ORDER BY CategoryID ASC;

-- Hãy liệt kê các nhân viên không phải là nữ từ bảng nhân viên.
SELECT * FROM dbo.Employees WHERE TitleOfCourtesy NOT IN ('Ms.', 'Mrs.');

-- Hãy liệt kê các nhân viên là nữ từ bảng nhân viên.
SELECT * FROM dbo.Employees WHERE TitleOfCourtesy IN ('Ms.', 'Mrs.');