--user6의 화면입니다.

--도서정보를 저장할 table생성
create table tbl_books(
b_seq number primary key,
b_title nVARCHAR2(100),
b_comp nVARCHAR2(50),
b_author nVARCHAR2(50),
b_price number
);

create SEQUENCE seq_book
start with 1
INCREMENT by 1;

insert into tbl_books(b_seq, b_title,b_comp,b_author,b_price)
values(seq_book.nextval,'모바일 웹','생능출판사','박성진',30000);

insert into tbl_books(b_seq, b_title,b_comp,b_author,b_price)
values(seq_book.nextval,'오라클SQL','길벗','홍형경',20000);

insert into tbl_books(b_seq, b_title,b_comp,b_author,b_price)
values(seq_book.nextval,'열혈자바','모름','모름',15000);

commit;