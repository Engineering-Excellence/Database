/* 중복 데이터를 삭제하는 DISTINCT */

SELECT DEPTNO
FROM EMP;

-- DISTINCT로 열 중복 제거하기(열이 한 개인 경우)
SELECT DISTINCT DEPTNO
FROM EMP;

-- DISTINCT로 열 중복 제거하기(열이 여러 개인 경우)
SELECT DISTINCT JOB, DEPTNO
FROM EMP;

-- ALL로 중복되는 열 제거 없이 그대로 출력하기(기본값)
SELECT ALL JOB, DEPTNO
FROM EMP;
SELECT JOB, DEPTNO
FROM EMP;
