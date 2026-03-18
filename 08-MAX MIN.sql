
USE NORTHWND;

-- Viết câu lệnh SQL tìm giá thấp nhất của các sẩn phẩm trong bảng Products.

SELECT MIN(UnitPrice)AS [SP có giá thấp nhất] FROM dbo.Products;

-- Viết câu lệnh lấy ra ngày đặt hàng gần đây nhất — từ bảng Orders.
SELECT MAX(OrderDate) AS [Ngày đặt hàng gần nhất] FROM dbo.Orders;

SELECT MIN(OrderDate) AS [Ngày đặt hàng xa nhất] FROM dbo.Orders;


-- Viết câu lệnh SQL tìm số lượng hàng trong kho (UnitsInStock) lớn nhất.
SELECT MAX(UnitsInStock) AS [số lượng trong kho lớn nhất] FROM dbo.Products;
