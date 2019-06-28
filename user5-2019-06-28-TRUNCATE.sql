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

--참조 무결성
--두개의 테이블이 아래와 같을때
ALTER TABLE tbl_score --child
ADD CONSTRAINT f_no FOREIGN KEY (sc_no)
REFERENCES tlb_student(st_no); --parents
--tlb_student : parents    tbl_score : child
--값이 있으면      >>      있을수도 있다.
--값이 없으면      >>      절대 없다
--반드시 존재      <<      있으면
--child에 값이 존재하면 parents는 삭제할 수 없다.

--두개의 테이블을 FOREIGN KEY로 연결하려면
--1. 연결하고자 하는 칼럼의 type의 크기가 같아야 한다.
--2. parents 에 있는 칼럼은 Primary Key이거나 UNIQUE이어야 한다.

SELECT * FROM tlb_student;

DELETE FROM tlb_student
WHERE st_no = '1';

--tbl_score의 FOREIGN KEY 삭제

ALTER TABLE tbl_score
DROP CONSTRAINT f_no;

ALTER TABLE tbl_score
ADD CONSTRAINT f_no FOREIGN KEY (sc_no)
REFERENCES tlb_student(st_no)
--부모 데이터를 삭제하려고 시도할때
--자식 데이터에 해당하는 키값이 존재하면 같이 지워라
on DELETE CASCADE;

--EQ JOIN
--참조무결성이 보장될때는 완벽한 리스트를 보장
--완벽한 리스트 : 두테이블간에 연결값이 반드시 존재하는상태
SELECT * FROM tbl_score , tlb_student
WHERE sc_no = st_no;

SELECT* FROM tbl_score;

DELETE FROM tlb_student WHERE st_no = '001';

INSERT INTO tlb_student(st_no,st_name,st_grade,st_dept_no)
VALUES ('001','홍길동',1,'001');

DELETE FROM tlb_student;

ALTER TABLE tbl_score
DROP CONSTRAINT f_no;

alter table tlb_student MODIFY st_no varchar(3);
alter table tbl_score modify sc_no VARCHAR(3);

SELECT * FROM tlb_student;

alter table tbl_score -- child table
add CONSTRAINT f_no FOREIGN key (sc_no) --child table의 칼럼
REFERENCES tlb_student(st_no) --parents table
on DELETE CASCADE ; -- 삭제조건

create SEQUENCE seq_score
start with 1 INCREMENT by 1;

insert into tbl_score(sc_seq,sc_date,sc_no,sc_subject,sc_score)
values(seq_score.nextval,'2019-06-28','001','과학',90);

delete from tbl_score;
delete from tlb_student;

