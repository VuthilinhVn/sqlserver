USE NORTHWND;
-- THÊM DỮ LIỆU VÀO BẢNG:
INSERT INTO [BẢNG] (column 1, column 2)
VALUES (value 1, value 2);

UPDATE [bảng]
SET column_name = new_value
WHERE Primary key = value;

ALTER TABLE [bảng]
ADD new_column NVARCHAR(100); -- attribute/kiểu dữ liệu

-- INNER JOIN HOẶC JOIN: TRẢ VỀ CÁC DÒNG DỮ LIỆU CÓ CẶP KHÓA SO SÁNH BẰNG NHAU VÀ TỒN TẠI CẢ 2 BẢNG
-- LEFT JOIN: TRẢ VỀ TẤT CẢ NHỮNG DÒNG DỮ LIỆU BẢNG BÊN TRÁI VÀ CÁC DÒNG ĐÚNG VỚI ĐIỀU KIỆN TỪ BẢNG BÊN PHẢI


-- Sử dụng INNER JOIN, Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
--Mã thể loại
-- Tên thể loại
-- Mã sản phẩm
--Mã sản phẩm
-- Tên sản phẩm
Select p.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from dbo.Products p
join dbo.Categories c
on p.CategoryID = c.CategoryID

-- Sử dụng INNER JOIN, Từ bảng Products và Categories, hãy đưa ra các thông tin sau đây:
-- Mã thể loại
-- Tên thể loại
-- Số lượng sản phẩm
select p.CategoryID, c.CategoryName, COUNT(p.ProductID) as [Số lượng sản phẩm]
from dbo.Products p
join dbo.Categories c
on p.CategoryID = c.CategoryID
group by p.CategoryID, c.CategoryName

-- hãy in ra các thông tin sau đây:
-- Mã đơn hàng
-- Tên công ty khách hàng
select o.OrderID, c.CompanyName
from dbo.Orders o
join dbo.Customers c
on o.CustomerID = c.CustomerID

-- hãy đưa ra các thông tin sau đây:
-- Mã thể loại
-- Tên thể loại
-- Tên sản phẩm
select c.CategoryName, c.CategoryID, p.ProductName
from dbo.Categories c
join dbo.Products p
on c.CategoryID = p.CategoryID

-- Hãy đưa ra tàn bộ thông tin CategoryID, CategoryName và tên thể loại sản phẩm towng ứng
INSERT INTO dbo.Categories (CategoryName)
VALUES ('Asian Food');

select c.CategoryID, c.CategoryName, p.ProductName
from dbo. Categories c
left join dbo.Products p
on c.CategoryID = p.CategoryID

insert into dbo.Products (ProductName)
values ('Them 1')

select c.CategoryID, c.CategoryName, p.ProductName
from dbo. Categories c
right join dbo.Products p
on c.CategoryID = p.CategoryID


select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from dbo. Categories c
full join dbo.Products p
on c.CategoryID = p.CategoryID

-- Liệt kê tên sản phẩm và tên nhà cung cấp
-- của các sản phẩm đã được đặt hàng trong bảng “Order Details”. 
select p.ProductName, sp.CompanyName
from dbo.[Order Details] od
join dbo.Products p on od.ProductID = p.ProductID
join dbo.Suppliers sp on sp.SupplierID = p.SupplierID

-- Liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng “Orders”. 
-- Bao gồm cả các đơn hàng không có nhân viên phụ trách.
insert into dbo.Orders (ShipCountry)
values ('Vietnam')

select o.OrderID, kh.CompanyName, e.LastName, e.FirstName
from dbo.Orders o
left join dbo.Customers kh on kh.CustomerID = o.CustomerID
left join dbo.Employees e on e.EmployeeID = o.EmployeeID




