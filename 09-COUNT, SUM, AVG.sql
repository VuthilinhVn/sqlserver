USE NORTHWND;

-- Count, sum and AVG
-- COUNT: đếm số lượng khác null thì ghi tên cột, còn nếu * là đếm tất cả số lượng dòng
--SUM: Tính tổng gtri của một cột, Nếu trong cột có bất kỳ giá trị null nào thì SUM=NULL
-- AVG: NULL KHI TẤT CẢ CÁC GTRI LÀ NULL, TÍNH AVG CHO CÁC GTRI KHÁC NULL;
-- Hãy đếm số lượng khách hàng có trong bảng  (Customers).
SELECT COUNT(*) AS [Số lượng khách hàng] FROM dbo.Customers; -- 91
SELECT COUNT(CustomerID) AS [Số lượng khách hàng khác null] FROM dbo.Customers;


-- Tính tổng số tiền vận chuyển (Freight)  của tất cả các đơn đặt hàng.
SELECT SUM(Freight) AS [Tổng tiền vận chuyển] FROM dbo.Orders;

-- Tính trung bình số lượng đặt hàng (Quantity) của tất cả các sản phẩm trong bảng [Order Details]
SELECT AVG(Quantity) AS [số lượng đặt hàng tb] FROM [dbo].[Order Details];

-- Đếm số lượng, tính tổng số lượng hàng trong kho 
-- và trung bình giá của các sản phẩm có trong bảng Product.
SELECT COUNT(*) AS [Số lượng sản phẩm ], SUM(UnitsInStock) AS [Tổng số lượng hàng trong kho],
AVG(UnitPrice) AS [TB giá SP]
FROM [dbo].[Products];



