--user6화면입니다

drop table tbl_iolist;
create table tbl_iolist(
io_seq	NUMBER	primary key	,
io_date	VARCHAR(10)		not null,
io_pcode	Nvarchar2(5)		not null,
io_ccode	Nvarchar2(5)		not null,
io_inout	Nvarchar2(1)		not null,
io_amt	NUMBER		,
io_price	NUMBER		,
io_total	NUMBER	
);

create SEQUENCE seq_iolist
start with 1 INCREMENT by 1;

select * from tbl_iolist;