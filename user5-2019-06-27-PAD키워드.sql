SELECT * FROM tlb_student;

commit;

select MAX(st_no) FROM tlb_student;

--칼럼의 type이 char이고
--칼럼의 데이터들이 숫자형일때만 사용가능한 문법
select MAX(st_no)+1 FROM tlb_student;

--현재 학생 테이블에서 st_no에 가장 마지막 학번 +1의 값으로
--새로운 학번을 생성
SELECT LPAD(MAX(st_no)+1,3,'0') FROM tlb_student;

--PAD 키워드는 특정한 값의 문자열의 패턴을 만드는 방법

--RPAD(값, 크기, 문자열) 크기를 지정 /값을 왼쪽에 위치/ 남는부분의 오른쪽에 문자열 채우기
--LPAD(값, 크기, 문자열) 크기를 지정 / 값을 오른쪽에 위치/ 남는부분의 왼쪽에 문자열 채우기
SELECT RPAD(3,5,'0') FROM DUAL;
SELECT LPAD(3,5,'A') FROM DUAL;