-- KIỂM TRA GIÁ TRỊ NULL: IS NULL - k có giá trị
-- IS NOT NULL : có giá trị, nhưng gtri empty
USE NORTHWND;

-- Lấy ra tất cả các đơn hàng chưa được giao hàng. (ShippedDate => NULL)
SELECT * FROM dbo.Orders WHERE ShippedDate IS NULL;
SELECT COUNT(*) AS [Số đơn hàng chưa được giao] FROM dbo.Orders WHERE ShippedDate IS NULL;

--  Lấy danh sách các khách hàng có khu vực (Region) không bị NULL.
SELECT * FROM dbo.Customers WHERE Region IS NOT NULL;

--  Lấy danh sách các khách hàng không có tên công ty (CompanyName).
SELECT * FROM dbo.Customers WHERE CompanyName IS NULL;