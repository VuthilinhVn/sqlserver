USE NORTHWND;

-- Tính số lượng đơn đặt hàng của từng khách hàng trong năm 1997
SELECT CustomerID, COUNT(OrderID) AS [TotalOrders]
FROM dbo.Orders WHERE YEAR(OrderDate) = '1997'
GROUP BY CustomerID;

-- Hãy lọc ra các đơn hang được đặt hàng vào tháng 5 năm 1997.
SELECT * FROM dbo.Orders WHERE YEAR(OrderDate)='1997' AND MONTH(OrderDate)='5'

-- Lấy danh sách các đơn hàng được đặt vào ngày 4 tháng 9 năm 1996.
SELECT * FROM dbo.Orders WHERE YEAR(OrderDate)='1996' AND MONTH(OrderDate)='9' AND DAY(OrderDate)='4'

SELECT * FROM dbo.Orders 
WHERE OrderDate = '1996-09-04'

-- Lấy danh sách khách hàng đặt hàng trong năm 1998 , 
--  và số đơn hàng mỗi tháng, sắp xếp tháng tăng dần.
SELECT CustomerID, COUNT(OrderID) AS [TotalOrders], MONTH(OrderDate) AS [Month]
FROM dbo.Orders
WHERE YEAR(OrderDate)='1998'
GROUP BY CustomerID, MONTH(OrderDate)
ORDER BY MONTH(OrderDate) ASC;



