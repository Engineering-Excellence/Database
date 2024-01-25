-- 필요한 데이터만 쏙 출력하는 WHERE절

/*
    기본 형식
    SELECT [조회할 열1 이름], [열2 이름], ..., [열N 이름]
    FROM [조회할 테이블 이름]
    WHERE [조회할 행을 선별하기 위한 조건식];
*/

-- EMP 테이블의 모든 열 출력하기
SELECT *
FROM EMP;

-- 부서 번호가 30인 데이터만 출력하기
SELECT *
FROM EMP
WHERE DEPTNO = 30;
