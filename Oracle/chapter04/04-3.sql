-- SQL의 기본 뼈대, SELECT절과 FROM절

/*
    기본 형식
    SELECT [조회찰 열0 이름], [열2 이름], ..., [열N 이름]
    FROM [조회할 테이블 이름];
*/

-- EMP 테이블 전체 열 조회하기
SELECT *
FROM EMP;

-- 테이블 부분 열 출력하기
SELECT EMPNO, ENAME, DEPTNO
FROM EMP;
