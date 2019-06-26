--user5

--JOIN은 2개의 테이블의 데이터가 분산되어 있을때
--A테이블에는 고객코드만 있고
--B테이블에는 고객정보가 들어있을경우
--A테이블의 데이터를 조회하면서
--B테이블의 고객정보를 연결하여
--A테이블의 고객코드가 누구를 가리키는지 알고자 할 때

--001 코코넛 10 100 1000 이란 데이터가 있을때
--001은 고객코드이고 현재 테이블에 데이터 칼럼이 없어서
--001 고객의 정보를 확인하려면 따로 고객테이블을 열어서 확인 해야 하는데
--두 테이블을 JOIN하면 한 리스트에서 같이 연동하여 조회할 수 있다

SELECT * FROM tbl_inout;

--5월 5일부터 5월 10까지 매입매출 정보를 확인
SELECT * From tbl_inout;
WHERE io_date BETWEEN '2018-05-05' and '2018-05-10';

--데이터를 조회했더니 SEQ 97번 데이터가 금액이 좀 많아 보인다.
--그래서 97번 데이터만 조회를 해본다
SELECT * FROM tbl_inout
WHERE io_seq=97;

--여기서 알수 있는것은
--상품코드가 P0220이고
--고객코드가 D0124라는 것만 알수 있다
--먼저 고객이 누구인지 확인하기 위해서
SELECT * FROM tbl_company
WHERE p_code = 'D0124';

--상품이 어떤 상품인지 확인
SELECT * FROM tbl_product
WHERE p_code = 'P0220';


--그래서 97거래내역을 조회할때
--상품정보와 고객정보를 한눈에 볼수 있으면 좋겟다 라는 생각이 든다
--이럴때 우리는 테이블을 조인 한다.
select io_seq, io_date, io_inout, 
        io_ccode,c.p_name,
        io_pcode,p.p_name,
        io_amt, io_price, io_total
from tbl_inout
    LEFT JOIN tbl_product p
        ON io_pcode = p.p_code
    LEFT JOIN tbl_company c
        ON io_ccode = c.p_code
where io_seq = 97;

--LEFT 의 왼쪽에 오는 테이블은 확인하고자 하는 주목적의 테이블을 위치
--주목적의 테이블을 확인하면서 보조적으로 정보를 확인하고자 하는 테이블을 오른쪽에 위치

Create VIEW view_iolist
as(
select io_seq, io_date, io_inout, 
        io_ccode,c.p_name,
        io_pcode,p.p_name,
        io_amt, io_price, io_total
from tbl_inout
    LEFT JOIN tbl_product p
        ON io_pcode = p.p_code
    LEFT JOIN tbl_company c
        ON io_ccode = c.p_code
);

select * from view_iolist
where io_seq = 07;

select * from view_iolist
where io_date between '2018-05-01' and '2018-05-31'
order by io_date;

select * from view_iolist
where io_date between '2018-05-01' and '2018-05-31'
order by io_ccode;

select * from view_iolist
where io_date between '2018-05-01' and '2018-05-31'
order by p_name;