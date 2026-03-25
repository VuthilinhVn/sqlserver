-- SUBQUERY là một câu truy vấn select, đc viết bên trong select/update/insert/delete khác
-- Subquery hoạt động như một mảng ảo tạm thời, dùng để trích xuất thông tin từ cấc bảng hoặc
-- dữ liệu khác trong cùng một câu truy vấn
USE NORTHWND;
-- Liệt kê toàn bộ sản phẩm
SELECT * FROM dbo.Products

-- Liệt kê productID, productName, UnitPrice
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products;

-- Tìm giá trung bình của các sản phẩm
SELECT AVG(UnitPrice)
FROM dbo.Products

-- Lọc những sản phẩm có giá lớn hơn giá trung bình
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM dbo.Products)

-- Lọc ra khách hàng có số đơn hàng > 10
SELECT o.CustomerID, c.CompanyName, COUNT(o.OrderID) as [TotalOrders]
FROM dbo.Customers c
LEFT JOIN dbo.Orders o
ON o.CustomerID = c.CustomerID
GROUP BY o.CustomerID, c.CompanyName
HAVING Count(o.OrderID)>10

-- other way
SELECT * FROM dbo.Customers
WHERE CustomerID in (
	SELECT CustomerID FROM dbo.Orders
	GROUP BY CustomerID
	HAVING Count(OrderID) >10)

-- Tinh tong tien cho tung don hang
SELECT o.*, t.Total
FROM dbo.Orders o
JOIN (
    SELECT OrderID, SUM(Quantity * UnitPrice) AS Total
    FROM dbo.[Order Details]
    GROUP BY OrderID
) t 
ON o.OrderID = t.OrderID;


select o.*, t.Total
from dbo.Orders o
join (
	select OrderID, sum(Quantity * UnitPrice) as Total
	from dbo.[Order Details]
	Group by OrderID) t
on o.OrderID = t.OrderID

-- Tên sản phẩm và tổng số đơn hàng của sản phẩm
select od.ProductID, p.ProductName, count(od.OrderID) as [Tổng đơn hàng]
from dbo.[Order Details] od
join (
	select ProductID, ProductName 
	from dbo.Products) p
on p.ProductID = od.ProductID
group by od.ProductID, p.ProductName

-- Mã đơn hàng và tổng giá trị của đơn hàng đó
select o.OrderID, (od.TotalPrices+  ISNULL(o.Freight, 0)) as [Tổng giá trị]
from dbo.Orders o
join (
	select OrderID, Sum(Quantity * UnitPrice*(1-Discount)) as TotalPrices
	from dbo.[Order Details] 
	Group by OrderID) od
on o.OrderID = od.OrderID













