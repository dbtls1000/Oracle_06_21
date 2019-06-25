--관리자
--c:/bizwork/mydb 폴더에 user5TS이름으로 tablespace를 생성하고
--초기크기는 500mb 자동증가 500kb
DROP TABLESPACE user5TS ;

CREATE TABLESPACE user5TS
DATAFILE 'C:/bizwork/mydb/user5TS.dbf'
size 500m AUTOEXTEND on next 100k;
--user5사용자를 생성
--dba로 권한을 부여


CREATE USER user5
IDENTIFIED BY 1234
DEFAULT TABLESPACE user5TS;

GRANT DBA TO user5;

--student 엑셀파일을 참조하여 학생 테이블을 생성하고 ㅎ엑셀 데이터를 임포트 수행

--엑섹파일의 성적데이터에 일련번호 칼럼을 추가하고
--테이블 생성해서 데이터 임포트 수행