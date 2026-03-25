-- COMMON TABLE EXPRESS (CTE):
-- WITH tên_cte (column 1, column 2, ...) as (
		--select truy vấn)
-- cte k thể tồn tại đơn đọc, nó cần đi cùng 1 query nhé
USE NORTHWND;
--VD:
WITH short_e as (
	select EmployeeID, LastName, FirstName
	from dbo.Employees
	)

select * from short_e;

-- Lấy thông tin về các sản phẩm (Products) có cùng thể loại với một sản phẩm cụ thể
SELECT ProductName, CategoryID
FROM dbo.Products
where CategoryID = (
	select CategoryID
	from dbo.Products
	where ProductName = 'Chai') -- có thể chạy cả ngàn lần

-- sử dụng cte
With ProductCategory as (
	select CategoryID
	from dbo.Products
	where ProductName='Chai'
	)

select p.ProductName, p.CategoryID
from dbo.Products p
join ProductCategory pc
on pc.CategoryID = p.CategoryID

-- Lấy thông tin đơn hàng Orders cùng với tổng giá trị và tỷ lệ giữa tổng giá trị và phí giao hàng

WITH TotalPrice (OrderId, TotalPrice) as (
	select OrderId, Sum(Quantity*UnitPrice*(1-Discount)) as TotalPrice
	from dbo.[Order Details]
	group by OrderID
	)

select o.OrderID, o.OrderDate, o.Freight, tp.TotalPrice, tp.TotalPrice/o.Freight as [tỷ lệ]
from dbo.Orders o
join TotalPrice tp
on tp.OrderID = o.OrderID

-- Lấy thông tin về các khách hàng có tổng giá trị đơn hàng lớn nhất
WITH AmountDetails(OrderID, Amount) as (
	select OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) as Amount
	from dbo.[Order Details]
	group by OrderID
	)

select o.OrderID, o.CustomerID, c.*
from dbo.Orders o
join dbo.Customers c
on o.CustomerID = c.CustomerID
join AmountDetails a
on a.OrderID = o.OrderID
where a.Amount = (select max(Amount) from AmountDetails)

-- sử dụng cte để tính tổng doanh số bán hàng cho từng sản phẩm tử 2 bảng order details và products
with doanhso (ProductID, Amount) as (
	select ProductID, Sum(Quantity*UnitPrice*(1-Discount)) as Amount
	from dbo.[Order Details]
	group by ProductID
	)
 select p.ProductID, p.ProductName, ds.Amount
 from dbo.Products p
 join doanhso ds
 on ds.ProductID = p.ProductID


 -- tính tổng doanh số bán hàng theo từng khách hàng, sau đó sắp xếp danh sách khách hàng theo tổng doanh số 
 -- giảm dần

with Amount (OrderID, Amount) as (
	select OrderID, sum(Quantity*UnitPrice*(1-Discount)) as Amount
	from dbo.[Order Details]
	group by OrderID
	)
select o.OrderID, o.CustomerID, c.CompanyName, a.Amount
from dbo.Orders o
join dbo.Customers c
on c.CustomerID = o.CustomerID
join Amount a
on a.OrderID = o.OrderID
order by a.Amount desc;


-- Tính tổng doanh số bán hàng theo từng năm từ bảng orders and order details
-- from orders and order details, caculate Amount per year
with Amount (OrderID, Amount) as (
	select OrderID, sum(Quantity*UnitPrice*(1-Discount)) as Amount
	from dbo.[Order Details]
	group by OrderID
	)

select year(o.OrderDate) as year, sum(a.Amount) as TotalAmount
from dbo.Orders o
join Amount a
on a.OrderID = o.OrderID
group by year(o.OrderDate)
