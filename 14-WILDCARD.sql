USE NORTHWND;
-- WILDCARD ký tự đại diện
-- % -> bl% thì có thể là bl, black, blue, blob...
-- _ 1 ký tự -> h_t thì có thể tìm đc hot, hit, hat...
-- [] tìm đc chưa ký tự trong brackets -> h[oa]t thì có thể là hot, hat, nhưng k có hit
-- ^ tìm những ký tự k trong brackets -> h[^oa]t thì sẽ là hit nhưng k phải là hot, hat

-- Hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ ‘A’
SELECT * FROM dbo.Customers WHERE ContactName LIKE 'A%';

-- Hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ ‘H’,  và có chữ thứ 2 là bất kỳ ký tự nào.
SELECT * FROM dbo.Customers WHERE ContactName LIKE 'H_%';

-- Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố ,có chữ cái bắt đầu là L, chữ cái thứ hai là u hoặc o.
SELECT * FROM dbo.Orders WHERE ShipCity LIKE 'L[uo]%';

-- Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu là L, chữ cái thứ hai khong là u hoặc o.
SELECT * FROM dbo.Orders WHERE ShipCity LIKE 'L[^uo]%';

-- Hãy lọc ra tất cả các đơn hang được gửi đến thành phố có , chữ cái bắt đầu là L, 
-- chữ cái thứ hai là các ký tự từ a đến e.
SELECT * FROM dbo.Orders WHERE ShipCity LIKE 'L[a-e]%';