USE NORTHWND;

-- update Cú pháp:
-- UPDATE table_name
-- SET column1 = value 1, column2=value2...
--WHERE condition;
DROP TABLE dbo.TestDelete;

SELECT * 
INTO TestUpdate
FROM dbo.Customers;

select column_name
from INFORMATION_SCHEMA.columns
where table_name = 'TestUpdate'

-- Cập nhật thông tin của một khách hàng trong bảng Customers là ALFKI, địa chỉ của khách hàng có . 


 UPDATE TestUpdate
 SET [Address] = 'New Address'
 WHERE CustomerID = 'ALFKI';

 SELECT *
FROM dbo.Customers
 WHERE CustomerID = 'ALFKI';

 SELECT *
FROM dbo.TestUpdate
 WHERE CustomerID = 'ALFKI';