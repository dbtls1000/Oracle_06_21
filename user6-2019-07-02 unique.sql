--user6화면입니다

SELECT *FROM tbl_student;

select * from tbl_score;

drop table tbl_score;
create table tbl_score(
SC_SEQ	NUMBER ,
SC_ST_NUM	VARCHAR2(5) not null,
SC_SUBJECT	NVARCHAR2(3) not null ,
SC_SCORE	NUMBER,
primary key(sc_seq)
);

--tbl_student와 tbl_score의 참조관계를 설정

alter table tbl_score
add CONSTRAINT f_st_num FOREIGN key (sc_st_num)
REFERENCES tbl_student(st_num)
on delete cascade;

--다중칼럼unique설정
--학번같고 과목번호가 같은 값이 2개 이상 없도록 하라하는 계약사항
--학번:0001 과목:1의 레코드가 있으면 0001,1의값은 저장하지 말라
alter table tbl_score
add CONSTRAINT u_st_num_subject UNIQUE (sc_st_num,sc_subject);

insert into tbl_score(sc_seq,sc_st_num,sc_subject,sc_score)
values (seq_score.nextval ,'00001','1',90);

commit;



