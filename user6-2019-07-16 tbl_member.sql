--user6
create table tbl_member(
m_userid	VARCHAR2(15)	Primary Key	,
m_password	VARCHAR2(64)		not null,
m_name	nVARCHAR2(30)		,
m_email	VARCHAR2(25)		not null,
m_tel	VARCHAR2(25)	,	
m_role	VARCHAR2(5)		
);

select * from tbl_member;

delete from tbl_member;
commit;