/* 결괏값을 원하는 열로 묶어 출력하는 GROUP BY 절 */

-- 집합 연산자를 사용하여 부서별 평균 급여 출력하기
SELECT AVG(SAL), '10' AS DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL), '20' AS DEPTNO
FROM EMP
WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL), '30' AS DEPTNO
FROM EMP
WHERE DEPTNO = 30;

/*
GROUP BY절의 기본 사용법

SELECT [조회할 열1 이름], [열2 이름], ..., [열n 이름]
FROM [조회할 테이블 이름]
WHERE [조회할 행을 선별하는 조건식]
GROUP BY [그룹화할 열을 지정(여러 개 지정할 수 있음)]
ORDER BY [정렬할 열 지정]
 */

-- GROUP BY를 사용하여 부서별 평균 급여 출력하기
SELECT AVG(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;

-- 부서 번호와 직책별 평균 급여로 정렬하기
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- 부서 번호별 평균 추가 수당을 출력
SELECT AVG(COMM), DEPTNO
FROM EMP
GROUP BY DEPTNO;

/*
-- GROUP BY절에 없는 열을 SELECT절에 포함할 때
SELECT ENAME, DEPTNO, AVG(SAL) -- ORA-00979: GROUP BY 표현식이 아닙니다.
FROM EMP
GROUP BY DEPTNO;
 */
