-- T-SQL: Transact-SQL : ngôn ngữ truy vấn mở rộng của ngôn ngữ SQL,
-- thuộc hệ sinh thái Microsoft (.NET, Azure, PowerBI)
-- Các thứ tương tự trong các hệ quản trị:
--(+) Oracle: PL/SQL
--(+) PostgreSQL: PL/pgSQL 
--(+) SQL Server: TSQL

-- Stored Procedures:
--(+) Là một tập hợp một hoặc nhiều câu lệnh T-SQL thanh 1 nhóm đơn vị xủ lý logic và được lưu trữ trên DB server
--(+) Khi một câu lệnh chạy stored procedure lần đầu tiên thì sql server sẽ chạy nó và lưu trữ vào bộ nhớ đệm, gọi là plan cache
-- những lần tiếp theo sql server sẽ sử dụng lại plan cache nên tốc độ xử lý tối ưu hơn
-- Cú pháp :
-- CREATE PROCEDURE procedure_name (
--	parameter 1 datatype, parameter 2 datatype...
--	)
--	AS
--	BEGIN
--		[statements]
--	END
USE NORTHWND;
GO
-- VD:
CREATE PROCEDURE GetProductByName
	@ProductName NVARCHAR(100)
AS
BEGIN
	SELECT * FROM Products P
	WHERE P.ProductName = @ProductName
END

GO
-- Sử dụng:
EXEC GetProductByName 'Chai'; -- nếu chỉ có 1 tham số thì truyền luôn

EXEC GetProductByName 'Chang';
EXEC GetProductByName 'Ikura';
GO
-- Tạo Stored procedure để tính tổng doanh số bán hàng của một nhân viên dựa trên EmployeeID
CREATE PROCEDURE GetTotalRevenueByEmployeeID
	@EmployeeID INT
AS
BEGIN
	SELECT	e.EmployeeID,
			(e.LastName + ' '+e.FirstName) as EmployeeName,
			SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) as [TotalRevenue]
	FROM Employees e
	JOIN Orders o ON o.EmployeeID = e.EmployeeID
	JOIN [Order Details] od ON od.OrderID = o.OrderID
	WHERE e.EmployeeID = @EmployeeID
	GROUP BY e.EmployeeID, e.FirstName, e.LastName
END

GO

EXEC GetTotalRevenueByEmployeeID '1';
EXEC GetTotalRevenueByEmployeeID '2';
EXEC GetTotalRevenueByEmployeeID '9';
GO
-- Tạo stored procedure để thêm mới khách hàng vào bảng Customers
CREATE PROCEDURE AddCustomers
	@CustomerID NVARCHAR(5),
	@CompanyName NVARCHAR(40),
	@ContactName NVARCHAR(30),
	@ContactTitle NVARCHAR(30)
AS
BEGIN
	INSERT INTO Customers(CustomerID, CompanyName, ContactName, ContactTitle)
	VALUES (@CustomerID, UPPER(@CompanyName), @ContactName, @ContactTitle) -- UPPER: viết hoa hết, LOWER viết thường hết
END
GO

EXEC AddCustomers '10', 'Vu thi linh', 'Mia Vu', 'Ms.';
select * from Customers;
GO
-- Tạo một stored Procedure để cập nhập giá của tất cả các sản phẩm thuộc một sản phẩm cụ thể
CREATE PROCEDURE UpdatePriceByCategoryID
	@ProductID INT,
	@AdjustmentPrice DECIMAL(18,2)
AS
BEGIN
	UPDATE Products
	SET UnitPrice = UnitPrice + @AdjustmentPrice
	WHERE ProductID = @ProductID
END
GO
Select * from Products where ProductID = 1;

EXEC UpdatePriceByCategoryID 1, -5; 