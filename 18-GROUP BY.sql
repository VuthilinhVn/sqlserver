-- GROUP BY sẽ dùng cungf với các hàm SUM, COUNT, AVG, MAX, MIN,...
USE NORTHWND;

-- Hãy cho biết mỗi khách hàng đã đặt bao nhiêu đơn hàng?
SELECT CustomerID, COUNT(OrderID) AS [Số đơn hàng] FROM dbo.Orders
GROUP BY CustomerID
ORDER BY [Số đơn hàng] ASC;

-- Hãy tính giá trị đơn giá trung bình theo mỗi nhà cung cấp sản phẩm.
SELECT SupplierID, AVG(UnitPrice) AS [đơn giá trung bình] FROM dbo.Products
GROUP BY SupplierID

-- Hãy cho biết mỗi thể loại có tổng số bao nhiêu sản phẩm trong kho (UnitsOnStock)?
SELECT CategoryID, SUM(UnitsInStock) AS [Số sp trong kho] FROM dbo.Products
GROUP BY CategoryID;

-- Hãy cho biết giá vận chuyển thấp nhất và lớn nhất  
--của các đơn hàng theo từng thành phố và quốc gia khác nhau.
SELECT ShipCity, ShipCountry, MIN(Freight) AS [ giá vận chuyển thấp nhất], MAX(Freight) AS [giá vận chuyển cao nhất]
FROM dbo.Orders 
GROUP BY ShipCity, ShipCountry
ORDER BY ShipCity ASC, ShipCountry ASC;
