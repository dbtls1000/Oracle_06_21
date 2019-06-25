--USER5

CREATE TABLE tlb_student(
st_no	CHAR(3)	PRIMARY KEY,
st_name	nVARCHAR2(30)		NOT NULL,
st_addr	nVARCHAR2(50)		,
st_grade	NUMBER(1)		NOT NULL,
st_height	NUMBER(3)		,
st_weight	NUMBER(3)		,
st_nick	nVARCHAR2(20)		,
st_nick_rem	nVARCHAR2(50)	,	
st_dept_no	CHAR(3)		NOT NULL
);

DROP TABLE tbl_score;
CREATE TABLE tbl_score(
sc_seq	NUMBER	PRIMARY KEY,
sc_date	nVARCHAR2(50)		NOT NULL,
sc_no	CHAR(3) NOT NULL,
sc_subject	nVARCHAR2(50)		,
sc_score	NUMBER		
);

SELECT * FROM tbl_score;

SELECT sc_date, sc_st_no,
    sum(decode(sc_subject,'국어',sc_score,0))AS 국어,
    sum(decode(sc_subject,'영어',sc_score,0))AS 영어,
    sum(decode(sc_subject,'수학',sc_score,0))AS 수학
from tbl_score
group by sc_date,sc_st_no;




