USE NORTHWND;

--Liệt kê các đơn hàng có ngày đặt hàng gần nhất

select * from dbo.Orders 
where OrderDate = (select max(OrderDate) from dbo.Orders);

-- Liệt kê tất cả các tên sản phẩm mà không có đơn đặt hàng nào mua chúng
select p.*
from dbo.Products p
where p.ProductID not in 
(select distinct ProductID from dbo.[Order Details] );

-- Lấy thông tin về các đơn hàng, tên sản phẩm, thuộc các đơn hàng chưa đc giao cho khách

select p.ProductID, p.ProductName, o.*
from dbo.Products p
join dbo.[Order Details] od
on od.ProductID = p.ProductID
join (
	select * from dbo.Orders
	where ShippedDate IS NULL) o
on o.OrderID = od.OrderID


-- Lấy thông tin về các sản phẩm có số lượng tồn kho 
--ít hơn số lượng tồn kho trung bình của tất cả các sản phẩm

select * from dbo.Products
where UnitsInStock < (select AVG(UnitsInStock) from dbo.Products)

-- Lấy thông tin về các khách hàng có tổng giá trị đơn hàng lớn nhất
select o.OrderID, c.*, gt.TotalAmount
from dbo.Orders o
join dbo.Customers c
on o.CustomerID = c.CustomerID
join (
	select OrderID, Sum(UnitPrice*Quantity*(1-Discount)) as TotalAmount
	from dbo.[Order Details] 
	group by OrderID
	) gt
on gt.OrderID = o.OrderID
where gt.TotalAmount = ( SELECT MAX(TotalAmount)
    FROM (
        SELECT SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalAmount
        FROM dbo.[Order Details]
        GROUP BY OrderID
    ) a
)




