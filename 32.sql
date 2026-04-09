USE NORTHWND;

-- XÂY DỰNG TRUY VẤN ĐỆ QUY
-- Dãy số fibo: Sn= S(n-1)+S(n-2)
WITH fibo(prev_n, n) as(
	-- khởi tạo
	select 0 as prev_n, 1 as n
	union all
	-- dệ quy
	select n as prev_n, prev_n+n as n
	From fibo
	)

select * from fibo
option (maxrecursion 5)



