--관리자 화면입니다

--사용자 생성
CREATE USER user1
IDENTIFIED BY 1234;

--권한부여
GRANT CREATE SESSION TO user1;
GRANT DBA TO user1;

--권한 회수
REVOKE CREATE SESSION TO user1;

--사용자정보삭제
DROP USER user1;

--사용자 정보와 모든 물리적인 데이터를 일괄 삭제한다.
--이 명령을 수행하면 사용자 정보와 관련된 모든 데이터는 거의 복구가 불가능
DROP USER user1 CASCADE;
