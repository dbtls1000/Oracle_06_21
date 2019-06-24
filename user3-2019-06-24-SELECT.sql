--USER3화면입니다

SELECT * FROM tbl_score;
SELECT * FROM tbl_student;

--다수의 table을 연동해서 SELECT
--score 테이블을 조회하면서
--학번에 해당하는 학생 정보를 같이 보여주기
--완전JOIN
SELECT * FROM tbl_score,tbl_student
WHERE sc_num = st_num;
--완전 join은 두 테이블에 where 조건으로 연결하는 칼럼의 값이 모두 존재할때 사용할 수 있는 join이다
--두 테이블이 완전하게 Relation 되었을때만 정상적인 리스트를 볼 수 있다.

SELECT *FROM tbl_score SC 
LEFT JOIN tbl_student ST
ON SC.sc_num = ST.st_num;

SELECT tbl_score.sc_num,tbl_score.sc_subject,tbl_score.sc_score,tbl_student.st_name FROM tbl_score
LEFT JOIN tbl_student 
ON tbl_score.sc_num = tbl_student.st_num;

SELECT *FROM tbl_score 
LEFT JOIN tbl_student 
ON tbl_score.sc_num = tbl_student.st_num;

-- LEFT JOIN * OUTTER JOIN
-- 왼쪽에 있는 TABLE의 데이터는 모두 보여주고
-- 오른쪽에 있는 TABLE 데이터는 ON조건에 맞는 데이터만 보여라
-- 만약 없으면 NULL표시
SELECT SC.sc_num,SC.sc_subject,SC.sc_score,ST.st_name FROM tbl_score
LEFT JOIN tbl_student 
ON tbl_score.sc_num = tbl_student.st_num;