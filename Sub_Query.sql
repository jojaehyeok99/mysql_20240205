USE practice_sql;

-- 서브쿼리 : 쿼리 내부에 위치하는 또 다른 쿼리, 쿼리 결과를 조건이나 테이블로 사용할 수 있도록 함

-- WHERE 절에서 서브쿼리 : 쿼리 결과를 조건으로 사용하여 조건을 동적으로 지정

SELECT * FROM employee
WHERE department_code = (
	SELECT code FROM department WHERE name = '인사부' 
);
