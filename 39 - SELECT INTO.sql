-- tạo bảng mới và sao chép dữ liệu từ bảng hiện có sang bảng mới 
-- -> thường dùng để tạo ra một bảng tạm thời trong quá trình phân tích, thống kê 
-- Cũng có thể đc dùng để trích một phần dữ liệu thôi để cải thiện tốc độ truy vấn query 
-- VD một công ty đã kinh doanh cả chục năm rồi, mình đang cần phân tích năm 2025 thôi,
-- -> trích dữ liệu ra 1 bảng nhỏ 2025 thôi để phân tích, ta dùng select into

-- Cú pháp:
-- SELECT *
-- INTO newtable [IN externaldb]
-- from oldtable
-- where condition;

-- Cú pháp 2:
-- SELECT column 1, column 2,...
--INTO newtable [IN externaldb]
--FROM oldtable
--WHERE condition;
USE NORTHWND;
-- Tạo ra bảng mới với các sản phẩm có giá >50;
SELECT *
INTO HighValueProducts
FROM dbo.Products
WHERE [UnitPrice]>50;

DROP TABLE HighValueProducts;

select * from dbo.Orders;
--  Tạo ra bảng mới với các đơn hàng được giao đến USA
SELECT *
INTO OderShipToUSAs
FROM dbo.Orders
WHERE [ShipCountry] = 'USA';

select * from OderShipToUSAs;

DROP TABLE OderShipToUSAs;


