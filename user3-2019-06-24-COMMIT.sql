--여기는 USER3 화면입니다

CREATE TABLE tbl_score(
--auto increment 다른 dbms에서는 insert를 수행할때 칼럼의 값을 자동으로 넘버링 해주는 옵션
--오라클 11 이하에서는 사용불가
--오라클 12 이상에서는 가능
sc_seq number primary key ,
sc_num char(5) not null,
sc_subject NVARCHAR2(10),
sc_score number
);


--오라클 11 이하에서는 자동증가 옵션이 없는 관계로
--별도의 넘버링용 요소를 사용해 자동 증가 효과를 만든다.
INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(1,'00001','영어',90);

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(2,'00001','영어',80);

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(3,'00001','수학',70);

SELECT * FROM tbl_score;

--오라클에서 자동 증가되는 넘버링 값을 얻기 위해서
--생성하는 객체
CREATE SEQUENCE seq_score
START WITH 1
INCREMENT BY 1;

SELECT seq_score.NEXTVAL FROM DUAL;

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(seq_score.NEXTVAL,'00002','영어',90);

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(seq_score.NEXTVAL,'00002','영어',80);

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(seq_score.NEXTVAL,'00002','수학',70);

SELECT * FROM tbl_score;

UPDATE  tbl_score
SET sc_score - 100
WHERE SC_SEQ = 10;

--만약 sc_seq 칼럼이 없다면
UPDATE  tbl_score
SET sc_score - 100
WHERE sc_num = '00002' AND sc_subject = '수학';

UPDATE sc_score
SET sc_subject = '미술'
WHERE sc_subject = '수학';

--UPDATE나 INSERT,DELETE를 수행하여도
--실제로 물리적 TABLE에 데이터가 저장되지 않는다.
--그래서 데이터를 강제로 물리적 TABLE에 저장해줄 필요가 있다.
COMMIT;
--ROLLBACK과는 반대되는개념

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(seq_score.NEXTVAL,'00003','영어',90);

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(seq_score.NEXTVAL,'00003','영어',80);

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(seq_score.NEXTVAL,'00003','수학',70);

SELECT*FROM TBL_SCORE;

--INSERT,UPDATE,DELETE된 데이터를 되돌리는 기술
-- 취소와 비슷한 개념
-- 가장최근에 COMMIT된 이후의 명령 수행을 취소하는 역할
-- 또는 가장 최근에 CREATE 명령을 수행한 이후의 명령수행을 취소하는 역할
ROLLBACK;
SELECT*FROM TBL_SCORE;




