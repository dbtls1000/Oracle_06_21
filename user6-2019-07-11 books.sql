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