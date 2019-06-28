--user5화면

--매우 위험한 명령
--DDL명령중
--DROP && CREATE이다
--tbl_student의 테이블을 새 테이블로 다시 만들겠다
TRUNCATE table tlb_student;
TRUNCATE table tbl_score;

--DDL명령중 FOREIG KEY(외래키)
-- 두테이블의 연관 제약사항을 만드는 방법

--참조 무결성 조건
--학생과 성적을 입력하는데
--학생에 없는 학번은 절대 성적에 입력할 수 없도록 방지하여
--학생에 없는 학번을 성적에 입력하는 실수를 방지하는 방법
ALTER TABLE tbl_score
ADD CONSTRAINT f_no FOREIGN KEY (sc_no)
REFERENCES tlb_student(st_no);

--001 학생의 국어점수를 추가하려고 시도를 했다 F_NO제약사항에 위배됨
INSERT INTO tbl_score(sc_seq,sc_date,sc_no,sc_subject,sc_score)
VALUES(1,'2019-06-28','001','국어',90);

--그래서 먼저 학생 데이터를 추가한다
INSERT INTO tlb_student(st_no,st_name,st_grade,st_dept_no)
VALUES ('001','홍길동',3,'001');

INSERT INTO tbl_score(sc_seq,sc_date,sc_no,sc_subject,sc_score)
VALUES(2,'2019-06-28','002','국어',90);