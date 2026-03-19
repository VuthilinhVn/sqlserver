USE NORTHWND;
-- Lấy danh sách các sản phẩm có giá bán trong khoảng từ 10 đến 20 đô la.
SELECT * FROM dbo.Products WHERE UnitPrice BETWEEN 10 AND 20
ORDER BY UnitPrice ASC;

-- Lấy danh sách các đơn đặt hàng được đặt trong khoảng thời gian từ ngày 1996-07-01 đến ngày 1996-07-31:
SELECT * FROM dbo.Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31'
ORDER BY OrderDate ASC;

-- Tính tổng số tiền vận chuyển (Freight) của các đơn đặt hàng được đặt trong khoảng thời gian từ ngày 1996-07-01 
-- đến ngày 1996-07-31:
SELECT SUM(Freight) AS [Tổng sô tiền vận chuyển] FROM dbo.Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

-- lọc ra sản phẩm từ bảng products những sản phẩm có ID lớn hơn 10 và bé hơn 20 và có giá bằng 50
SELECT * FROM dbo.Products WHERE (ProductID BETWEEN 10 AND 20) AND UnitPrice=50;

-- lọc ra các tên nhân viên có id từ 10 đến 20 ;
SELECT * FROM dbo.Employees WHERE EmployeeID BETWEEN 10 AND 20;