use NORTHWND;
-- Windows functions
--Funtion_name(expression) over (
	--[Partition by partition_expression,...]
	--[order by	sort_expression [asc|desc],...]
	--[rows between frame_specification]
--)
-- (+) Row_number -> xếp hạng theo đúng số của hàng đó, k nhảy, 2 dữ liệu trùng nhau vẫn lần lượt (1,2,3,4...)
-- (+) Rank -> xếp hạng nếu 2 dữ liệu = nhau sẽ cùng rank, và dữ liệu tiếp theo sẽ bị nhảy hạng (1,1,3,4..)
-- (+) dense_rank -> xếp hạng nếu 2 dữ liệu = nhau sẽ cùng rank, nhưng dữ liệu tiếp theo sẽ k bị nhảy hạng( 1, 1, 2,3..)
-- (+) LAG và LEAD cho phép việc đọc dữ liệu của row trước (LAG) hoặc sau (LEAD).
--		2 hàm này cực kì hữu dụng để so sánh row với nhau. 
-- (+) Last_value (column) : trả về giá trị cuối cùng của cột trong window
-- (+) First_value(column): giá trị đầu tiên của cột
-- (+) sum(column): tổng gtri của cột
-- (+) avg(column) giá trị tb của cột
-- (+) count(column): đếm số lượng có gtrij k null của cột
-- (+) min(column) giá trị min của cột
-- (+) max(colum) giá trị max của cột
-- (+) percent_rank(): xếp hạng dòng dự trên % vị trí của dòng trong window, trả về từ 0-1
-- (+) cume_dist(): dòng đó thuộc bao nhiêu phần trăn của dữ liệu trong window
-- Xếp hạng sản phẩm nào đắt tiền nhất toàn bộ table
select 
	ProductId,
	ProductName,
	CategoryID,
	UnitPrice,
	RANK() over (order by UnitPrice desc) as Ranking
from dbo.Products

-- xếp hạng sản phẩm nào đắt tiền nhất loại
select 
	ProductID,
	ProductName,
	CategoryID, 
	UnitPrice,
	Rank() over (partition by CategoryID order by UnitPrice desc) as Ranking
from dbo.Products

CREATE TABLE [sinh_vien] (

    [ma_sinh_vien] INT PRIMARY KEY,

    [ho_ten] NVARCHAR(255),

    [diem_trung_binh] DECIMAL(3, 2),

    [ma_lop_hoc] INT

);

INSERT INTO [sinh_vien] ([ma_sinh_vien], [ho_ten], [diem_trung_binh], [ma_lop_hoc])

VALUES

    (1, N'Nguyễn Văn A', 3.75, 101),

    (2, N'Trần Thị B', 3.88, 102),

    (3, N'Phạm Văn C', 3.75, 101),

    (4, N'Huỳnh Thị D', 3.92, 103),

    (5, N'Lê Văn E', 3.60, 102),

    (6, N'Ngô Thị F', 3.78, 101),

    (7, N'Trịnh Văn G', 3.65, 102),

    (8, N'Võ Thị H', 3.80, 103),

    (9, N'Đặng Văn I', 3.55, 101),

    (10, N'Hoàng Thị K', 3.95, 102),

    (11, N'Mai Thị L', 3.70, 103),

    (12, N'Lý Thị M', 3.62, 101),

    (13, N'Chu Thị N', 3.85, 102),

    (14, N'Đỗ Thị P', 3.58, 103),

    (15, N'Dương Văn Q', 3.72, 101),

    (16, N'Lâm Thị R', 3.85, 102),

    (17, N'Nguyễn Văn S', 3.68, 101),

    (18, N'Nguyễn Thị T', 3.75, 103),

    (19, N'Nguyễn Văn U', 3.93, 102),

    (20, N'Nguyễn Thị V', 3.67, 101);


select * from dbo.sinh_vien;

-- xếp hạng sinh viên toàn trường dựa trên điểm số giảm dần
select *,
rank() over (order by diem_trung_binh desc) as ranking
from dbo.sinh_vien

-- Xếp hạng sinh viên theo từng lớp học dựa trên điểm tb giảm dần
select ma_sinh_vien, ho_ten, diem_trung_binh, ma_lop_hoc,
		rank() over (partition by ma_lop_hoc order by diem_trung_binh desc) as ranking
from dbo.sinh_vien;

--  Xếp hạng sinh viên theo từng lớp học dựa trên điểm tb giảm dần, không nhảy hạng (dense_rank)
select *,
	dense_rank() over (partition by ma_lop_hoc order by diem_trung_binh desc) as ranking
from dbo.sinh_vien;

-- Xếp hạng sinh viên theo từng lớp học dựa trên điểm tb giảm dần, không bị trùng hạng(row_number)
select *, 
	row_number() over (partition by ma_lop_hoc order by diem_trung_binh desc) as ranking
from dbo.sinh_vien;


-- 
-- Chúng ta sẽ sử dụng hàm LAG() lấy thông tin về đơn đặt hàng 
--  và ngày đặt hàng của đơn đặt hàng trước đó cho mỗi khách hàng.
select CustomerID, OrderID, OrderDate,
	lag(OrderDate) over (partition by CustomerID order by OrderDate asc) as PreviousOrderDate
from dbo.Orders
order by CustomerID, OrderDate asc;

-- Với mỗi đơn hàng, hiển thị: OrderID, tổng tiền của đơn đó,tổng tiền toàn bộ hệ thống
select OrderID,
	sum(UnitPrice*Quantity*(1-Discount)) over (partition by OrderID) as [Tổng tiền của đơn],
	sum(UnitPrice*Quantity*(1-Discount)) over() [Tổng tiền toàn bộ hệ thống]
from dbo.[Order Details];

-- Mỗi đơn hàng hiển thị: OrderID, CustomerID, tổng tiền của khách đó
WITH details AS (
    SELECT o.OrderID, o.CustomerID,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Amount
    FROM dbo.Orders o
    JOIN dbo.[Order Details] od
        ON o.OrderID = od.OrderID
    GROUP BY o.OrderID, o.CustomerID
)
select OrderID, CustomerID, Amount,
	sum(Amount) over (partition by CustomerID) as TotalAmount_per_Customer
	from details;
-- Với mỗi Customer: lấy 3 đơn hàng có giá trị cao nhất
with details as (
	select o.OrderID, o.CustomerID, 
			sum(od.Quantity*od.UnitPrice*(1-od.Discount)) as AmountPerOrderID
	from dbo.Orders o
	join dbo.[Order Details] od
	on o.OrderId = od.OrderID
	group by o.OrderID, o.CustomerID)

select CustomerID, OrderID, AmountPerOrderID, 
	ROW_NUMBER() over (partition by CustomerID order by AmountPerOrderID desc) as Ranking
from details
