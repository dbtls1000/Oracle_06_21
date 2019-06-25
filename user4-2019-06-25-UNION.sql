--user4화면입니다

--월별로 매입,매출,마진을확인하는 쿼리
SELECT SUBSTR(io_date,0,7),
    SUM(DECODE(io_inout,'매입',io_total,0))AS 매입금액,
    SUM(DECODE(io_inout,'매출',io_total,0))AS 매출금액,
    
    SUM(DECODE(io_inout,'매출',io_total,0)) -
    SUM(DECODE(io_inout,'매입',io_total,0))AS 마진

FROM tbl_iolist
GROUP BY SUBSTR(io_date,0,7)


UNION

SELECT '=====',00000,00000,00000 FROM DUAL

UNION

SELECT 
    '총계',
    SUM(DECODE(io_inout,'매입',io_total,0))AS 매입금액,
    SUM(DECODE(io_inout,'매출',io_total,0))AS 매출금액,
    
    SUM(DECODE(io_inout,'매출',io_total,0)) -
    SUM(DECODE(io_inout,'매입',io_total,0))AS 마진
    
FROM tbl_iolist;

