--USER3 화면입니다
SELECT * FROM tbl_score;
SELECT * FROM SYS.tbl_student;

INSERT INTO tbl_score(sc_seq , sc_num, sc_subject, sc_score)
VALUES(seq_score.NEXTVAL,'0003','국어',90);

INSERT INTO tbl_score(sc_seq , sc_num, sc_subject, sc_score)
VALUES(seq_score.NEXTVAL,'0003','영어',80);

INSERT INTO tbl_score(sc_seq , sc_num, sc_subject, sc_score)
VALUES(seq_score.NEXTVAL,'0003','수학',70);

commit

--user2와 user3는 모두 DBA권한을 가지고 있다
--만약 user2가 DBA가 아닌 제한된 권한을가진 사용자라면
--다른 schema에 있는 table은 조회가 불가능하다
--내 schema에 있는 table을 다른 사용자가 조회할 수 있도록
--권한을 열어주어야 한다
--내 schema에 있는 tbl_score table을 user2가 조회할 수 있도록 권한을 열어준다

GRANT SELECT ON tbl_score TO user2;

GRANT INSERT ON tbl_score TO user2;

GRANT DELETE ON tbl_score TO user2;

GRANT UPDATE ON tbl_score TO user2;

GRANT INSERT,SELECT,DELETE,UPDATE ON tbl_score TO user2;

SELECT * FROM DBA_SYS_PRIVS ORDER BY GRANTEE;

--현재 사용자에게 부여한 권한 조회
SELECT * FROM USER_SYS_PRIVS;

--현재 사용자가 다른 사용자에게 부여한 권한 조회
SELECT * FROM USER_TAB_PRIVS;