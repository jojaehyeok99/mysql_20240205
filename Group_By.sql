USE practice_sql;

CREATE TABLE jeju2 AS SELECT * FROM jeju;

UPDATE jeju2 SET observe_date = '7월 상반기'
	WHERE observe_date BETWEEN '2023-07-01' AND '2023-07-15';
        
UPDATE jeju2 SET observe_date = '7월 하반기'
	WHERE observe_date BETWEEN '2023-07-16' AND '2023-07-31';

UPDATE jeju2 SET observe_date = '8월 상반기'
	WHERE observe_date BETWEEN '2023-08-01' AND '2023-08-15';
        
UPDATE jeju2 SET observe_date = '8월 하반기'
	WHERE observe_date BETWEEN '2023-08-16' AND '2023-08-31';

UPDATE jeju2 SET observe_date = '9월 상반기'
	WHERE observe_date BETWEEN '2023-09-01' AND '2023-09-15';
        
UPDATE jeju2 SET observe_date = '9월 하반기'
	WHERE observe_date BETWEEN '2023-09-16' AND '2023-09-31';
    
SELECT * FROM jeju2; 

-- 그룹화(GROUP BY) : 레코드를 하나 이상의 컬럼으로 그룹하여 결과를 도출하고자 할 때 사용
-- 					일반적으로 집계함수와 함께 사용됨

SELECT observe_date FROM jeju2 GROUP BY observe_date;  

# 7월 상반기안에 데이터는 15개지만, 그룹화 할때는 하나의 데이터만 나타내기 때문에 15개의 데이터를 나타낼려고 할때는 안됨 
SELECT observe_date, speed_80m FROM jeju2 GROUP BY observe_date; 
# 위의 그룹화를 하고 싶을 때는 select 뒤에 speed_80m 추가해서 쓸 수는 있다 하지만 밑에 처럼 쓰는건 의미가 없음
SELECT observe_date, speed_80m FROM jeju2 GROUP BY observe_date, speed_80m;

SELECT observe_date, AVG(speed_80m) FROM jeju2 GROUP BY observe_date;

#---------------------------------------------------------------------------------------------#

-- 필터링 (HAVING) : 그룹화된 결과에 필터링을 적용하는 명령어
-- 주의! WHERE 절과 사용방법이 같지만 WHERE 절은 SELECT 이전에 실행되고 
-- 		HAVING 절은 SELECT 이후에 실행됨
SELECT observe_date, AVG(speed_80m) AS avg 
FROM jeju2 
GROUP BY observe_date
HAVING avg > 5.5;
-- FROM -> AVG -> AS -> SELECT -> GROUP BY -> HAVING

SELECT observe_date, AVG(speed_80m) AS avg 
FROM jeju2 
GROUP BY observe_date
HAVING speed_80m > 5.5;
-- 요것은 안됨 이유는? : FROM - AVG - AS -SELECT - GROUP BY - HAVING -> 필터링을 할 때 speed_80m인 이름이 없음 

SELECT observe_date, AVG(speed_80m) AS avg 
FROM jeju2 
WHERE speed_80m > 5.5
GROUP BY observe_date;
-- FROM - WHERE - AVG - AS - SELECT - GROUP BY











