-- Trình bày lại data ra 1 table mới dễ nhìn hơn --> nó k lưu table nên nó đc gọi là virtual table
-- Cú pháp:
-- CREATE VIEW view_name AS
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition;

USE NORTHWND;
GO 

CREATE VIEW [MonthlySales] AS
SELECT Year(OrderDate) as [Năm],
	Month(OrderDate) as [Tháng],
	Count(OrderID) as [ Số lượng đơn hàng]
from Orders
group by year(OrderDate), month(OrderDate);
GO

select * from MonthlySales;
GO
-- Tạo view từ bảng customers và orders
CREATE VIEW CustomerOrders AS
SELECT 
	c.CustomerID,
	c.CompanyName,
	c.ContactName,
	o.OrderID,
	o.OrderDate,
	o.ShipCountry
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;
GO

-- Chốt bảo vệ có cho phép người dùng cập nhật dữ liệu tỏng view hay không:
-- WITH CHECK OPTION
-- Tạo một view có tên ""HighValueProducts" để hiển thị danh sách các sp có giá trị cao hơn $50
CREATE VIEW HighValueProducts AS
SELECT *
FROM Products
WHERE UnitPrice >50
WITH CHECK OPTION;
GO 

SELECT * FROM HighValueProducts;

UPDATE HighValueProducts
SET UnitPrice = 10 
WHERE ProductID = 9; -- Lổi Error do có check option
GO
-- Tạo một view có tên CustomerOrders để hiển thị thông tin về khách hàng và số lượng hàng của họ
CREATE VIEW CustomerOrder AS
SELECT c.CustomerID, 
		c.CompanyName,
		c.ContactName, 
		Count(o.OrderID) as [So luong don hang]
From Customers c
Join Orders o ON o.CustomerID = c.CustomerID
Group by c.CustomerID, c.CompanyName, c.ContactName
GO

-- Tạo một View có tên EmployeeSalesByYear để hiển thị tổng doanh số bán hàng của từng nhân viên theo năm
CREATE VIEW EmployeeSalesByYear AS
SELECT  e.EmployeeID,
		Year(o.OrderDate) as [Year],
		(e.FirstName + ' ' + e.LastName) as EmployeeName,
		sum(od.Quantity*od.UnitPrice*(1-od.Discount)) as [Tổng doanh thu]
FROM Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY Year(o.OrderDate), e.EmployeeID,(e.FirstName + ' ' + e.LastName);

select * from EmployeeSalesByYear;
GO

-- Tạo một View có tên CategoryProductCounts để hiển thị số lượng sản phẩm trong mỗi danh mục sản phẩm
CREATE VIEW CategoryProductCounts AS
SELECT c.CategoryID,
		c.CategoryName,
		Count(p.ProductID) as [Số lượng sản phẩm]
FROM Categories c
JOIN Products p ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName;
Go
Select * from CategoryProductCounts
order by [Số lượng sản phẩm] desc;

-- Tạo một view có tên CustomerOrderSummary để hiển thị tổng số đơn đặt hàng của mỗi khách hàng

