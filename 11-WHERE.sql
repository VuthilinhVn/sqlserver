USE NORTHWND;

-- mệnh đề WHERE: lọc điều kiện
-- Bạn hãy liệt kê tất cả các nhân viên đến từ thành phố London.
SELECT * FROM dbo.Employees WHERE City='London';

--  Bạn hãy liệt kê tất cả các nhân viên đến từ thành phố London.  
--Sap xep ket qua theo LastName A->Z
SELECT * FROM dbo.Employees WHERE City='London'
ORDER BY LastName ASC;

--  Bạn hãy liệt kê tất các đơn hàng bị giao muộn, 
-- biết rằng ngày cần phải giao hàng là RequiredDate, 
-- ngày giao hàng thực tế là ShippedDate.
SELECT * FROM dbo.Orders WHERE ShippedDate > RequiredDate;

--  Lấy ra tất cả các đơn hàng chi tiết được giảm giá nhiều hơn 10%.
SELECT * FROM dbo.[Order Details] WHERE Discount > 0.1;

-- Dùng câu lệnh SQL lấy ra 5 sản phẩm đầu tiên  có giá bán lớn hơn 18$ từ bảng Products, sắp xếp giảm dần
SELECT TOP 5 * FROM dbo.Products WHERE UnitPrice > 18
ORDER BY UnitPrice DESC;

-- Dùng câu lệnh SQL lấy ra tất cả các sản phẩm có số lượng tồn kho > 100 sản phẩm, sắp xếp tăng dần 
SELECT * , (UnitsInStock-UnitsOnOrder) AS [Số tồn kho] 
FROM dbo.Products 
WHERE (UnitsInStock-UnitsOnOrder)>100 -- lệnh này sẽ chạy trước select nhé 
ORDER BY [Số tồn kho] ASC;








