USE NORTHWND;
-- UNION: phải thỏa: Số cột phải bằng nhau, Kiểu dữ liệu tương ứng và Thứ tự cột giống nhau
-- UNION (auto xóa trùng)
-- UNION ALL (giữ nguyên tất cả)

-- Từ bảng Order Details hãy liệt kê 
--các đơn đặt hàng có Unit Price 
--nằm trong phạm vi từ 100 đến 200.
--  I 

select OrderID
from dbo.[Order Details]
where UnitPrice between 100 and 200

-- Lấy tất cả đơn hàng có quantity = 10 hoặc 20
select OrderID
from dbo.[Order Details]
where Quantity in (10,20)

-- Từ bảng Order Details hãy liệt kê các 
-- đơn đặt hàng có Unit Price nằm trong phạm vi 100 đến 200
-- VÀ đơn hàng phải có Quantity = 10 hoặc 20
select OrderID
from dbo.[Order Details]
where (Quantity in (10,20)) and (UnitPrice between 100 and 200)

-- Từ bảng Order Details hãy liệt kê các 
-- đơn đặt hàng có Unit Price nằm trong phạm vi 100 đến 200
-- hoặc đơn hàng phải có Quantity = 10 hoặc 20 => 448 rows
select OrderID
from dbo.[Order Details]
where (Quantity in (10,20)) or (UnitPrice between 100 and 200)

-- Từ bảng Order Details hãy liệt kê các 
-- đơn đặt hàng có Unit Price nằm trong phạm vi 100 đến 200
-- hoặc đơn hàng phải có Quantity = 10 hoặc 20 dùng distinct => 360 rows
select distinct OrderID
from dbo.[Order Details]
where (UnitPrice between 100 and 200) or (Quantity in (10,20));

select OrderID
from dbo.[Order Details]
where UnitPrice between 100 and 200
UNION 
select OrderID
from dbo.[Order Details]
where Quantity in (10,20)

select OrderID
from dbo.[Order Details]
where UnitPrice between 100 and 200
UNION ALL
select OrderID
from dbo.[Order Details]
where Quantity in (10,20)
