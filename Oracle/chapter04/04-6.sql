-- 원하는 순서로 출력 데이터를 정렬하는 ORDER BY

/*
    기본 형식
    SELECT [조회할 열1 이름], [열2 이름], ..., [열N 이름]
    FROM [조회할 테이블 이름]
    (그 밖의 절)
    ORDER BY [정렬하려는 열 이름(여러 열 지정가능)] [정렬 옵션];
*/

-- EMP 테이블의 모든 열을 급여 기준으로 오름차순 정렬하기
SELECT *
FROM EMP
ORDER BY SAL;

-- EMP 테이블의 모든 열을 급여 기준으로 내림차순 정렬하기
SELECT *
FROM EMP
ORDER BY SAL DESC;

-- EMP 테이블의 전체 열을 부서 번호(오름차순)와 급여(내림차순)로 정렬하기
SELECT *
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;
