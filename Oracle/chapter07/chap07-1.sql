/* 하나의 열에 출력 결과를 담는 다중행 함수 */

-- SUM 함수를 사용하여 급여 합계 출력하기
SELECT SUM(SAL)
FROM EMP;

/*
-- SUM 함수를 사용하여 사원 이름과 급여 합계 출력하기
SELECT ENAME, SUM(SAL)  -- ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
FROM EMP;
 */

-- 추가 수당 합계 구하기
SELECT SUM(COMM)
FROM EMP;

-- 급여 합계 구하기(DISTINCT, ALL 사용)
SELECT SUM(DISTINCT SAL)
     , SUM(ALL SAL)
     , SUM(SAL)
FROM EMP;

-- EMP 테이블의 데이터 개수 출력하기
SELECT COUNT(*)
FROM EMP;

-- 부서 번호가 30번인 직원 수 구하기
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 30;

-- COUNT 함수를 사용하여 급여 개수 구하기(DISTINCT, ALL 사용)
SELECT COUNT(DISTINCT SAL)
     , COUNT(ALL SAL)
     , COUNT(SAL)
FROM EMP;

-- COUNT 함수를 사용하여 추가 수당 열 개수 출력하기
SELECT COUNT(COMM) /* NULL 제외 */
FROM EMP;

-- COUNT 함수와 IS NOT NULL을 사용하여 추가 수당 열 개수 출력하기
SELECT COUNT(COMM)
FROM EMP
WHERE COMM IS NOT NULL;

-- 부서 번호가 10인 사원의 최대 급여 출력하기
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10;

-- 부서 번호가 10인 사원의 최소 급여 출력하기
SELECT MIN(SAL)
FROM EMP
WHERE DEPTNO = 10;

-- 부서 번호가 20인 사원의 입사일 중 최근 입사일 출력하기
SELECT MAX(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

-- 부서 번호가 20인 사원의 입사일 중 가장 오래된 입사일 출력하기
SELECT MIN(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

-- 부서 번호가 30인 사원의 평균 급여 출력하기
SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO = 30;

-- DISTINCT로 중복을 제거한 급여 열의 평균 급여 구하기
SELECT AVG(DISTINCT SAL)
FROM EMP
WHERE DEPTNO = 30;

-- 부서 번호가 30인 사원의 평균 추가 수당을 출력
SELECT AVG(COMM)
FROM EMP
WHERE DEPTNO = 30;
