-- Viết câu lệnh SQL lấy ra tên của tất cả các sản phẩm
SELECT [ProductName]
FROM [dbo].[Products];

-- Viết câu lệnh SQL lấy ra tên sản phẩm, giá bán trên mỗi đơn vị, số lượng sản phẩm trên đơn vị
SELECT [ProductName],[UnitPrice],[QuantityPerUnit]
FROM [dbo].[Products];

-- Viết câu lệnh SQL lấy ra tên công ty của khách hàng, và quốc gia của các khách hàng đó
SELECT [CompanyName], [Country]
FROM [dbo].[Customers];

--  Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng Products
SELECT *
FROM [dbo].[Products];

-- Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng khách hàng  – Customers
SELECT *
FROM [dbo].[Customers];

-- Đối với table name không có dấu space thì k cần viết [] hoặc ''
-- Nhưng nếu table name có dấu space trong tên thì phải có [] hoặc ''

-- lấy ra tên và số điện thoại của tất cả các nhà cung cấp hang 
SELECT [CompanyName],[Phone]
FROM [dbo].[Suppliers];

-- Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng nhà cung cấp  – [Suppliers]
SELECT *
FROM [dbo].[Suppliers];

-- Lấy EmployeeID, LastName, FirstName từ bảng Employees
SELECT [EmployeeID], [LastName], [FirstName]
FROM [dbo].[Employees];







