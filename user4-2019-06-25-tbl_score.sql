--USER4화면

DROP TABLE tbl_score;
CREATE TABLE tbl_score(
sc_seq	NUMBER	PRIMARY KEY,
sc_date	VARCHAR2(10)		NOT NULL,
sc_st_no	CHAR(3)		NOT NULL,
sc_subject	nVARCHAR2(50)		NOT NULL,
sc_score	NUMBER		
);

CREATE SEQUENCE seq_score
START WITH 100
INCREMENT BY 1;

SELECT * FROM tbl_score;

--UPDATE tbl_score
--SET sc_subject = '한국어'
--WHERE sc_subject = '국어'

--성적테이블과 학생테이블이 분리된 상태
--성적정보를 보면서 학번에대한 학생이 누구인지 알고 싶으면
--JOIN을 실행해서 확인
CREATE TABLE tbl_test
AS(
SELECT SC.sc_date,SC.sc_st_no,ST.st_name,ST.st_addr,SC.sc_subject,SC.sc_score
FROM tbl_score SC
LEFT JOIN tbl_student ST
ON SC.sc_st_no = ST.st_no
);

SELECT * FROM tbl_test;
--조용필 학생의 주소가 NULL인데 주소가 확인이 되어 주소를 입력
UPDATE tbl_test
SET st_addr = '서울특별시'
WHERE st_num = '조용필';
--하지만 이러한 명령을 수행하는 과정에서
--만약 조용필 학생이 동명이인이 있다면
--실제 변경하지 말아야 할 데이터가 변겨외는ㄴ 사태가 발생을 한다.
--그래서 다수의 레코드를 변경하는 명령은 매우 신중하게 사용해야 한다.

SELECT * FROM tbl_student;
UPDATE tbl_student
SET st_addr = '서울특별시'
WHERE st_no = '001';

SELECT SC.sc_date,SC.sc_st_no,ST.st_name,ST.st_addr,SC.sc_subject,SC.sc_score
FROM tbl_score SC
LEFT JOIN tbl_student ST
ON SC.sc_st_no = ST.st_no;

--데이터 베이스 제 2 정규화
--성적 데이터로부터 과목정보를 별도로 분리하여
--과목테이블로 생성을 하고 성적을 조회할때 과목테이블과 join하여 ㅗㄹ 수 있도록 설정할 예정

--1.성적데이터로부터 과목정보를 추출
SELECT sc_subject
FROM tbl_score
GROUP BY sc_subject
ORDER BY sc_subject;
--2.과목테이블 생성
CREATE TABLE tbl_subject(
    sb_no	CHAR(3)	PRIMARY KEY,
    sb_name	nVARCHAR2(20)		NOT NULL,
    sb_rem	nVARCHAR2(50)		
);
--3 과목데이터 추가 테이블 생성.
INSERT INTO tbl_subject(sb_no, sb_name,sb_rem)
VALUES('001','국어','한국어능력시험');
INSERT INTO tbl_subject(sb_no, sb_name,sb_rem)
VALUES('002','수학','고등수학');
INSERT INTO tbl_subject(sb_no, sb_name,sb_rem)
VALUES('003','영어','스피킹');

SELECT *FROM tbl_subject;

SELECT *
FROM tbl_score SC
LEFT JOIN tbl_subject SB
ON SC.SC_SUBJECT = SB.SB_NAME;

--4.점수테이블에는 과목의 이름만 존재하고 있기 때문에
--  과목의 이름에 해당하는 과목코드를 점수테이블에 업데이트 해 주어야 한다.
--  가. 과목테이블에 과목코드 칼럼을 하나 추가

ALTER TABLE tbl_score ADD (sc_sb_no CHAR(3));

--  나. 과목테이블로 부터 점수 테이블에 있는 과목이름을 참조하여 과목코드를
--      점수테이블에 업데이트를 실행

-- 먼저 tbl_score 테이블을 펼쳐놓고
--tbl_score테이블의 sc_subject 칼럼의 값을
--sub sql인 SELECT문에게 보낸다
--sub SQL인 SELECT문은
--  tbl_subject테이블에서 sc_subject를 검색하여 일치하는 값이 있으면
--  과목코드를 return한다
--  UPDATE명령은 return받은 과목코드를 tbl_score sc_sb_no칼럼에
--   UPDATE를 실행한다.
UPDATE tbl_score SC
SET SC.sc_sb_no = (
    SELECT sb_no FROM tbl_subject SB
    WHERE SB.sb_name = SC.sc_subject
    );

SELECT * FROM tbl_score;

--5.tbls_score의 sc_subject 칼럼을 삭제
ALTER TABLE tbl_score DROP COLUMN sc_subject;

SELECT * FROM tbl_score;

--tbl_score 테이블을 제2정규화 완료했다.

SELECT *
FROM tbl_score SC
LEFT JOIN tbl_subject SB
ON SC.sc_sb_no = SB.sb_no;

SELECT * FROM tbl_subject;

UPDATE tbl_subject
SET sb_rem = '훈민정음'
WHERE sb_no = '001';

--점수를 확인하면서
-- 과목코드에 대한 과목명도 보고
-- 학번에 대한 학생이름도 같이 보고
DROP VIEW view_score;

CREATE VIEW view_score
AS(
SELECT 
    SC.sc_date,SC.sc_st_no,ST.ST_name,ST.st_addr,
    SC.sc_sb_no,SB.sb_name,SC.sc_score
FROM tbl_score SC
LEFT JOIN tbl_subject SB
ON SC.sc_sb_no = SB.sb_no
LEFT JOIN tbl_student ST
ON SC.sc_st_no = ST.st_no
);

SELECT *FROM VIEW_SCORE;