USE practice_sql;

-- 제약조건 : 데이터베이스 컬럼(column)에 적용되는 규칙
-- 데이터의 정확성, 일관성, 무결성을 보장

-- NOT NULL 제약조건 : 해당 컬럼에 null을 포함하지 못하도록 함
-- INSERT, UPDATE에 영향을 미침

CREATE TABLE not_null_table(
	null_column INT,
    not_null_column INT NOT NULL
);

-- NOT NULL 제약조건이 걸린 not_null_column에 값을 지정하지 않음
INSERT INTO not_null_table(null_column) VALUES (1); # 기술블로그 쓸 때 에러가 뜨는 이유와 고치는 방법 적어두면 좋다!
-- NOT NULL이 지정된 컬럼은 INSERT시에 반드시 null이 아닌 값이 입력되어야 함
INSERT INTO not_null_table (not_null_column) VALUES(1);
INSERT INTO not_null_table (not_null_column) VALUES(null);
-- NOT NULL이 지정된 컬럼은 UPDATE시에 null을 지정할 수 없음
UPDATE not_null_table SET not_null_column = null;

#--------------------------------------------------------------#
-- UNIQUE 제약조건 : 특정 걸럼에 들어오는 모든 값들을 중복없이 들어오도록 함
-- INSERT, UPDATE에 영향을 미침
CREATE TABLE unique_table (
	unique_column INT UNIQUE,
    not_unique_column INT
);

INSERT INTO unique_table VALUES(1,1);
-- UNIQUE로 지정된 컬럼은 INSERT시에 중복된 데이터를 지정할 수 없음
INSERT INTO unique_table VALUES(1,1);
INSERT INTO unique_table VALUES(2,1);
-- UNIQUE로 지정된 컬럼은 UPDATE시에 중복된 값으로 변경할 수 없음
UPDATE unique_table SET unique_column = 3;

#--------------------------------------------------------------#
-- NOT NULL + UNIQUE = 후보키로 지정
-- 후보키 : 레코드를 식별하기 위한 컬럼 (중복 x, null x)

CREATE TABLE candidate_table(
	candidate_column INT NOT NULL UNIQUE,
    unique_column INT 
    );

INSERT candidate_table VALUES (1,null);

#--------------------------------------------------------------#
-- PRIMARY KEY : 특정 칼럼을 기본키로 지정함
-- 기본키 : 후보키 중에 기능상 선택한 하나의 컴럼
-- 자신 테이블에서의 INSERT, UPDATE / 참조되어지는 테이블의 INSERT, UPDATE에 영향을 미침
CREATE TABLE primary_table (
	primary_column INT PRIMARY KEY,
    nomal_column INT
);

-- PRIMARY KEY 제약조건은 INSERT 시에 NOT NULL의 조건과 UNIQUE의 조건을 만족해야 함
INSERT INTO primary_table VALUES(null, null);
INSERT INTO primary_table VALUES(1, null);
INSERT INTO primary_table VALUES(1, null);

-- PRIMARY KEY 제약조건은 UPDATE 시에 NOT NULL 조건과 UNIQUE 조건을 만족해야 함
UPDATE primary_table SET primary_column = null;
UPDATE primary_table SET primary_column = 2;