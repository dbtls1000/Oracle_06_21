--여기는 USER3 입니다

-- tbl_score에 저장된 레코드의 개수
SELECT COUNT(*) FROM tbl_score;
--조건에 맞는 레코드의 개수
SELECT COUNT(*) FROM tbl_score
WHERE sc_num = '00001';
--합계를 계산하는 집계함수
--일반적으로 NUMBER로 되어있는 칼럼에서만 유효
SELECT SUM(sc_score)
FROM tbl_score;

--각 학생별로 3과목의 합계가 얼마인지 알고싶다면
SELECT sc_num , SUM(sc_score)--그룹으로 묶인 레코드들만의 점수합계
FROM tbl_score
GROUP BY sc_num; -- 학번으로 전체 데이터를 그룹화

--ROUND : 반올림함수
--ROUND() : 소수점이하 1자리 반올림 후 정수료 표시
--ROUND(값,자릿수) : 자릿수 +1 의 자리에서 반올림하고 자릿수까지 표시
SELECT sc_num , ROUND(AVG(sc_score),2)
FROM tbl_score
GROUP BY sc_num;

--최대값
SELECT MAX(sc_score)
FROM tbl_score;

--최소값
SELECT MIN(sc_score)
FROM tbl_score;

--중복값 제외하고 보여주기
SELECT DISTINCT sc_num
FROM tbl_score;

SELECT sc_num , SUM(sc_score)
FROM tbl_score
GROUP BY sc_num;

--과목칼럼을 기준으로 오름차순 정렬
SELECT sc_num , sc_subject, sc_score
FROM tbl_score
ORDER BY sc_subject;

--학번으로 정렬을 수행하고
--같은학번이 있으면 그 내부에서 과목으로 다시 정렬
SELECT * FROM tbl_score
ORDER BY sc_num ASC,sc_subject ASC;--ASC는 생략 가능

--학번으로 내림차순 정렬하고 내부에서 과목으로 내림차순 정렬
SELECT * FROM tbl_score
ORDER BY sc_num DESC,sc_subject DESC; --내림차순은 DESC

--학번으로 내림차순 정렬하고 내부에서 과목으로 오름차순 정렬
SELECT * FROM tbl_score
ORDER BY sc_num DESC,sc_subject;

--과목이 국어인 리스트를 추출하여
--GROUP BY를 실행
--점수를 합산학고 합삼된 정수가 230보다 큰 리스트만 보여라
SELECT sc_num, SUM(sc_score) --3
FROM tbl_score
WHERE sc_subject = '국어' --1
GROUP BY sc_num --2 
HAVING SUM(sc_score) > 230; --4

