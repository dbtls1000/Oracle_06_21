--USER3 화면입니다

SELECT SC.sc_num,ST.st_name,sc.sc_subject,SC.sc_score
FROM tbl_score SC
LEFT JOIN tbl_student ST
ON SC.sc_num = ST.st_num;

SELECT SC.sc_num,ST.st_name,SUM(SC.sc_score)
FROM tbl_score SC
LEFT JOIN tbl_student ST
ON SC.sc_num = ST.st_num
GROUP BY SC.SC_NUM, ST.ST_NAME
ORDER BY SC.SC_NUM;

SELECT SC.sc_num,ST.st_name,SUM(SC.sc_score) AS 총점,
TRUNC(AVG(SC.sc_score)) AS 평균1,
ROUND(AVG(SC.sc_score)) AS 평균2
FROM tbl_score SC
LEFT JOIN tbl_student ST
ON SC.sc_num = ST.st_num
GROUP BY SC.SC_NUM, ST.ST_NAME
HAVING ROUND(AVG(SC.sc_score)) >= 80
ORDER BY SC.SC_NUM;