--user6화면입니다
drop table tbl_memo;

create table tbl_memo(
mo_seq	NUMBER	Primary Key	not null,
mo_date	VARCHAR2(10)		Not null,
mo_time VARCHAR2(10)		Not null,
mo_author	nVARCHAR2(50)	,	
mo_subject	nVARCHAR2(125)	,	
mo_memo	nVARCHAR2(1000)		
);

select * from tbl_memo;

--오라클의 Random값을 생성하는 코드
SELECT ROUND(DBMS_RANDOM.VALUE(0,99999999999),0) FROM DUAL;