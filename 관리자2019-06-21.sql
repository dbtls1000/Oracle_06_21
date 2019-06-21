--관리자 질의 작성기 화면
SELECT * FROM access$;

SELECT *
FROM access$
WHERE d_obj# = 1299;

--SQL명령문은 대표키워드로 시작해서 보조 키워드들이 나열되는 형태이며
--일반적으로 명령문이나 변수명 들은 대소문자 구별이 없다
-- 다만 작성할때 학습차원에서
-- 키워드는 대문자로 사용하고 기타변수명 등은 소문자로 작성한다

--SQL명령문은 여러줄에 걸쳐 사용할 수 있고
--명령문의 끝에는 세미콜론을 붙여준다

--명령문 중간에서 ctrl + enter를 누르면 해당하는 명령문을 
--오라클 DBMS에게 전송하고 결과를 보여준다

--연습을 위해서 잠시 DBA가 되어보자

--테이블객체
--CREATE TABLE은 데이터 저장소의 최소단위
--실제로 데이터들을 보관할 장소
--테이블 객체를 생성할 수 있는 권한은 DBA에게 있다
--DBA가 아닌경우는 일반적으로 테이블 객체를 생성할 수 없다
CREATE TABLE tbl_student (
    st_name nVARCHAR2(30), -- 데이터의 필드, 멤버변수 역할 DB에서는 칼럼이라고 부른다.
    st_age NUMBER
    )
    
INSERT INTO tbl_student(st_name,st_age)
VALUES('홍길동',33);

    

    