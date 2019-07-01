--THIS IS USER6

CREATE TABLE tbl_STUDENT(
ST_NUM VARCHAR2(5) PRIMARY KEY,
ST_NAME NVARCHAR2(50) NOT NULL,
ST_TEL VARCHAR2(20),
ST_GRADE NUMBER
);

INSERT INTO tbl_student ( ST_NUM, ST_NAME , ST_TEL , ST_GRADE)
VALUES('00001','홍길똥','001',3);
INSERT INTO tbl_student ( ST_NUM, ST_NAME , ST_TEL , ST_GRADE)
VALUES('00002','썽춘향','011',4);
INSERT INTO tbl_student ( ST_NUM, ST_NAME , ST_TEL , ST_GRADE)
VALUES('00003','리몽룡','101',1);
INSERT INTO tbl_student ( ST_NUM, ST_NAME , ST_TEL , ST_GRADE)
VALUES('00004','임꺽쩡','031',2);
INSERT INTO tbl_student ( ST_NUM, ST_NAME , ST_TEL , ST_GRADE)
VALUES('00005','짱녹수','061',3);

commit;

select * from tbl_student;

create table tbl_score(
    sc_seq number primary key,
    sc_st_num varchar2(5) not null,
    sc_subject nvarchar2(20) not null,
    sc_score number
    );
    
create SEQUENCE seq_score
start with 1 INCREMENT by 1;

insert into tbl_score(sc_seq,sc_st_num,sc_subject,sc_score)
values(seq_score.nextval,'00001','국어',90);
    