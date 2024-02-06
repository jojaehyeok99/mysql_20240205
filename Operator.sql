USE practice_sql;

-- jeju column 추가 (DDL)
ALTER TABLE jeju ADD above_avg_spd BOOLEAN;
ALTER TABLE jeju ADD above_avg_dir BOOLEAN;
ALTER TABLE jeju ADD null_column1 DOUBLE;
ALTER TABLE jeju ADD null_column2 DOUBLE;

-- jeju column 데이터 추가 (DML)
UPDATE jeju
SET above_avg_spd = true
WHERE speed_80m > 5.5;

UPDATE jeju
SET above_avg_spd = false
WHERE speed_80m <= 5.5;

UPDATE jeju
SET above_avg_dir = true
WHERE direction_50m > 160;

UPDATE jeju
SET above_avg_dir = false
WHERE direction_50m <= 160;

UPDATE jeju
SET null_column1 = speed_80m
WHERE speed_80m > 5.5;

UPDATE jeju
SET null_column2 = direction_50m
WHERE direction_50m > 160;

#----------------------------------------------------------------------#
-- 연산자
-- 산술연산자 : +, -, *, /, %

SELECT speed_80m + speed_76m + speed_70m + speed_35m AS total_speed
FROM jeju;

SELECT (speed_80m + speed_76m + speed_70m + speed_35m) / 4 AS avg_speed
FROM jeju;

#-------------------------------------------------------------------#
-- 비교연산자 (WHERE절에서 자주 사용)

-- = : 좌항이 우항과 같으면 true
SELECT * FROM jeju WHERE observe_date = '2023-07-05';

-- <>, != : 좌항이 우항과 다르면 true
SELECT * FROM jeju WHERE observe_date <> '2023-07-05';
SELECT * FROM jeju WHERE observe_date != '2023-07-05';

-- < : 좌항이 우항보다 작으면 true
-- <= : 좌항이 우항보다 작거나 같으면 true
SELECT * FROM jeju WHERE speed_80m < 3.5;
SELECT * FROM jeju WHERE speed_80m <= 3.5;

-- > : 좌항이 우항보다 크면 true
-- >= : 좌항이 우항보다 크거나 같으면 true
SELECT * FROM jeju WHERE speed_80m > 3.5;
SELECT * FROM jeju WHERE speed_80m >= 3.5;

-- <=> : 좌항과 우항이 모두 null이면 true
SELECT * FROM jeju WHERE null_column1 <=> null_column2;

-- IS : 좌항이 우항과 같으면 true (키워드)
-- IS NOT : 좌항이 우항과 다르면 true (키워드)
SELECT * FROM jeju WHERE above_avg_spd IS TRUE; # 값이 1인 결과만 출력
SELECT * FROM jeju WHERE above_avg_dir IS NOT FALSE; # 결과가 왜 1인 것만 출력되는지?

-- IS NULL : 좌항이 NULL이면 true
-- IS NOT NULL : 좌항이 NULL이 아니면 true
SELECT * FROM jeju WHERE null_column1 IS NULL; # null인 값만 출력
SELECT * FROM jeju WHERE null_column1 IS NOT NULL; # 데이터에 값이 있는 것만 출력

-- BETWEEN min AND max : 좌항이 min보다 크거나 같으면서 max보다 작거나 같으면 true
-- NOT BETWEEN min AND max : 좌항이 min보다 작거나 max보다 크면 true
SELECT * FROM jeju WHERE direction_50m BETWEEN 270 AND 360;
SELECT * FROM jeju WHERE direction_50m NOT BETWEEN 270 AND 360;

-- IN() : 주어진 값중에 하나라도 일치하는 값이 존재하면 true
-- NOT IN() : 주어진 값 들이 모두 일치하지 않으면 true
SELECT * FROM jeju WHERE observe_date 
	IN ('2023-07-01','2023-08-01','2023-09-01','2023-10-01','2023-11-01','2023-12-01');

SELECT * FROM jeju WHERE observe_date 
	NOT IN ('2023-07-01','2023-08-01','2023-09-01','2023-10-01','2023-11-01','2023-12-01');

#----------------------------------------------------------------------#
-- 논리연산자

-- AND(&&) : 좌항과 우항이 모두 true이면 true 
SELECT * FROM jeju WHERE speed_80m > 4 AND direction_50m <180;

-- OR(||) : 좌항과 우항 중 하나라도 true이면 true
SELECT * FROM jeju WHERE speed_80m > 4 OR direction_50m <180;

-- XOR : 좌항과 우항이 다르면 true
SELECT * FROM jeju WHERE speed_80m > 4 XOR direction_50m <180;


