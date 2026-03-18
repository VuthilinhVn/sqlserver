-- ORDER BY: SẮP XẾP
-- ASC (TĂNG DẦN) - MẶC ĐỊNH NẾU KHÔNG GHI
-- DESC (GIẢM DẦN)

USE NORTHWND;

-- Bạn hãy liệt kê tất cả các nhà cung cấp theo thứ tự tên đơn vị CompanyName Từ A-Z
SELECT * FROM dbo.Suppliers
ORDER BY CompanyName ASC;

-- Bạn hãy liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần.
SELECT * FROM dbo.Products
ORDER BY UnitPrice DESC;

-- Bạn hãy liệt kê tất cả các nhân viên theo thứ tự họ và tên đệm A-Z. Không dùng ASC | DESC
SELECT * FROM dbo.Employees
ORDER BY LastName ASC, FirstName ASC;


-- Lấy ra một sản phẩm có số  lượng order cao nhất -- k dùng max
SELECT TOP 1 *
FROM dbo.[Order Details]
ORDER BY Quantity DESC;