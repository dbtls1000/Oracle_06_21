
create table tbl_inout(
io_seq	NUMBER	primary key	,
io_date	VARCHAR2(10)	not null,
io_product	Nvarchar2(50)	not null,
io_comp	Nvarchar2(50)	not null,
io_comp_ceo	Nvarchar2(50),
io_inout	Nvarchar2(50)	not null,
io_amt	NUMBER,
io_price	NUMBER,
io_total	NUMBER		
);

select io_inout , count(*) from tbl_inout
group by io_inout;

--매입매출정보에서 상품이름 리스트를 추출하여 상품정보 테이블로 생성
select io_product, count(*) from tbl_inout
group by io_product;

select io_product from tbl_inout
group by io_product
order by io_product;

create table tbl_product(
p_code	VARCHAR2(5)	Primary Key	,
p_name	nVARCHAR2(50)		not null,
p_iprice	NUMBER		,
p_oprice	NUMBER		
);

--매입매출 테이블에서 상품정보 테이블을 만들고
--매입매출에 이쓴 모든 상품이름이 상품정보 테이블에 반영 되었나 확인
--아래 select에서 리스트가 1개라도 나오면 잘못 만들어진 상품정보가 된다.
select from tbl_inout io
left join tbl_product p
on io.io_io_product = p.p_name
where p.p_name is null;

--tbl_inout에 상품코드 칼럼을 추가하고
--tbl_product테이블과 연동하여 상품코드 칼럼을 update
alter table tbl_inout add io_pcode VARCHAR2(5);

--테이블 구조를 변경한후 변경된 테이블 구조를 확인
DESC tbl_inout;

--생성된 io_pcode 칼럼에 값을 update한다
--상품정보 테이블에서 상품이름으로 검색을 하여 각 상품에 맞는
--상품코드를 tbl_iolist에 update
update tbl_inout io
set io_pcode = (select p_code from tbl_product p
                where io.io_product = p.p_name); 

--상품코드를 업데이트 하고 제대로 잘 수행 되었는지 검증
--이 경우도 리스트가 1개라도 나타나면 잘못된 명령수행
select io.io_pcode,p.p_code,p.p_name
from tbl_inout io
left join tbl_product p
on io.io_pcode = p.p_code
where p.p_code is null or p.p_name is null;

--io_product 삭제
alter table tbl_inout drop column io_product;

desc tbl_inout;

--거래처정보 분리하기
--거래처며와 ceo명을 리스트로 추출
select io_comp,io_comp_ceo
from tbl_inout
group by io_comp,io_comp_ceo;


create table tbl_company(
p_code	VARCHAR2(5)	primary key	,
p_name	nVARCHAR2(50)		not null,
p_ceo	nVARCHAR2(50)		not null,
p_tel	VARCHAR2(20)		,
p_addr	nVARCHAR2(220)	
);


select io.io_comp , c.p_name
from tbl_inout io
left join tbl_company c
on io.io_comp = c.p_name
where c.p_name is null;

--칼럼생성
alter table tbl_inout add io_ccode varchar2(5);

--update 수행
update tbl_inout io
set io_ccode = (select c.p_code from tbl_company c
                where io.io_comp = c.p_name and
                    io.io_comp_ceo = c.p_ceo);
                    

select io.io.ccode,io.io_comp,c.p_name,c.p_ceo
from tbl_inout io
left join tbl_company c
on io.io_ccode = c.p_code
where c.p_name is null;

--거래처 거래처대표명 삭제
alter table tbl_inout drop column io_comp;
alter table tbl_inout drop column io_comp_ceo;

desc tbl_inout;
--매입매출테이블,상품테이블,거래처테이블을 조인하여 리스트
drop view view_inout;

--view를 생성하기위해 질의를 작성할때
--다른테이블의 칼럼이름중에 규칙성 있는 alais를 설정해 두면
--view활용해서 또다른 select를 구현할때
--훨씬 편리하게 사용할 수 있다
create view view_inout
as(
        select
        IO_DATE,
        IO_PCODE,
        IO_CCODE,
        p_CEO,
        p_TEL,
        IO_INOUT,
        IO_AMT,
        IO_PRICE,
        IO_TOTAL
        from tbl_inout io
        LEFT JOIN TBL_product p
        on io.io_pcode = p.p_code
        LEFT JOIN tbl_company c
        on io.io_ccode = C.p_code
        );
        
select * from view_inout;

