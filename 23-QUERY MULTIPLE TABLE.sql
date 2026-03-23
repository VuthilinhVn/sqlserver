
USE NORTHWND;
-- Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products AS p, dbo.Categories AS c
WHERE c.CategoryID = p.CategoryID

-- Từ bảng Employees và Orders, hãy in ra các thông tin sau đây:
-- Mã nhân viên
-- Tên nhân viên
-- Số lượng đơn hàng mà nhân viên đã bán được
SELECT o.EmployeeID, e.LastName, e.FirstName, COUNT(OrderID) AS [tổng đơn hàng]
FROM dbo.Employees AS e, dbo.Orders as o
WHERE e.EmployeeID = o.EmployeeID
GROUP BY o.EmployeeID, e.LastName,e.FirstName

-- Từ bảng Customers và Orders, hãy in ra các thông tin sau đây:
--Mã số khách hàng
-- Tên công ty
--Tên liên hệ
-- Số lượng đơn hàng đã mua
-- Với điều kiện: quốc gia của khách hàng là UK
SELECT o.CustomerID, c.CompanyName, c.ContactName,c.Country, COUNT(OrderID) AS [TotalOrder]
FROM dbo.Customers as c, dbo.Orders as o
WHERE c.CustomerID = o.CustomerID and c.Country = 'UK'
GROUP BY o.CustomerID, c.CompanyName, c.ContactName, c.Country

-- Từ bảng Orders và Shippers, hãy in ra các thông tin sau đây:
-- Mã nhà vận chuyển
-- Tên công ty vận chuyển
-- Tổng số tiền được vận chuyển (Sum Frieght)
-- Và in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giảm dần.

SELECT o.ShipVia, s.CompanyName, SUM(Freight) AS [ tổng số tiền vận chuyển]
FROM dbo.Orders as o, dbo.Shippers as s
WHERE o.ShipVia = s.ShipperID
GROUP BY o.ShipVia, s.CompanyName
ORDER BY SUM(Freight) DESC;

-- Từ bảng Products và Suppliers, hãy in ra các thông tin sau đây:


