-- Cú pháp:
--DELETE FROM table_name WHERE condition; 
-- -> Xóa đúng cái dòng có điều kiện đó, kbh viết câu lệnh delete khi k có where -> nguy hiểm mất dữ liệu
USE NORTHWND;

select *
into TestDelete
from dbo.Customers;

-- Xóa một khách hàng ALFKI
Delete from dbo.TestDelete where CustomerID= 'ALFKI';
select * from TestDelete;
--Xóa đi toàn bộ khách hàng có quốc gia bắt đầu bằng ‘U’
delete from dbo.TestDelete where Country like 'U%';

-- xóa sạch một bảng
Delete from dbo.TestDelete;

select * from dbo.TestDelete;

-- Vậy DELETE FROM khác gì với TRUNCATE?? 

-- (+) DELETE → Khi cần xoá có chọn lọc, hoặc cần rollback an toàn
-- (+) TRUNCATE → Khi muốn làm sạch toàn bộ bảng nhanh nhất

TRUNCATE TABLE TestDelete;






