/* 연산자 종류와 활용 방법 알아보기 */

-- 곱셈 산술 연산자를 사용한 예
SELECT *
FROM EMP
WHERE SAL * 12 = 36000;

-- 대소 비교 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL >= 3000;

-- 문자를 대소 비교 연산자로 비교하기(비교 문자열이 문자 하나일 때)
SELECT *
FROM EMP
WHERE ENAME >= 'F';

-- 문자열을 대소 비교 연산자로 비교하기(비교 문자열이 문자 여러 개일 때)
SELECT *
FROM EMP
WHERE ENAME <= 'FORZ';

-- 등가 비교 연산자(!=)를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL != 3000;

-- 등가 비교 연산자(<>)를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL <> 3000;

-- 등가 비교 연산자(^=)를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL ^= 3000;

-- NOT 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE NOT SAL = 3000;

-- OR 연산자를 사용하여 여러 개 조건을 만족하는 데이터 출력하기
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
   OR JOB = 'SALESMAN'
   OR JOB = 'CLERK';

-- IN 연산자를 사용하여 출력하기
/*
    SELECT [조회할 열1 이름], [열2 이름], ..., [열N 이름]
    FROM [조회할 테이블 이름]
    WHERE 열 이름 IN (데이터1, 데이터2, ..., 데이터N);
*/
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

-- 등가 비교 연산자와 AND 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE JOB != 'MANAGER'
  AND JOB <> 'SALESMAN'
  AND JOB ^= 'CLERK';

-- IN 연산자와 논리 부정 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

-- 대소 비교 연산자와 AND 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL >= 2000
  AND SAL <= 3000;

-- BETWEEN A AND B 연산자를 사용하여 출력하기
/*
    SELECT [조회할 열1 이름], [열2 이름], ..., [열N 이름]
    FROM [조회할 테이블 이름]
    WHERE 열 이름 BETWEEN 최솟값 AND 최댓값;
*/
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

-- BETWEEN A AND B 연산자와 NOT 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자 사용하여 출력하기
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- 사원 이름의 두 번째 글자가 L인 사원만 출력하기
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

-- 사원 이름에 AM이 포함되어 있는 사원 데이터만 출력하기
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

-- 사원 이름에 AM이 포함되어 있지 않은 사원 데이터 출력하기
SELECT *
FROM EMP
WHERE ENAME NOT LIKE '%AM%';

-- 와일드 카드 문자가 데이터 일부일 경우(ESCAPE)
/*
    SELECT *
    FROM SOME_TABLE
    WHERE SOME_COLUMN LIKE 'A\_A%' ESCAPE '\';
*/

-- 별칭을 사용하여 열 이름 출력하기
SELECT ENAME, SAL, SAL * 12 + COMM AS ANNSAL, COMM
FROM EMP;

-- 등가 비교 연산자로 NULL 비교하기
SELECT *
FROM EMP
WHERE COMM = NULL;

-- IS NULL 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE COMM IS NULL;

-- 직속 상관이 있는 사원 데이터만 출력하기
SELECT *
FROM EMP
WHERE MGR IS NOT NULL;

-- AND 연산자와 IS NULL 연산자 사용하기
SELECT *
FROM EMP
WHERE SAL > NULL
  AND COMM IS NULL;

-- OR 연산자와 IS NULL 연산자 사용하기
SELECT *
FROM EMP
WHERE SAL > NULL
   OR COMM IS NULL;

-- 집합 연산자(UNION)를 사용하여 출력하기
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

-- 집합 연산자(UNION)를 사용하여 출력하기(출력 열 개수가 다를 때): ORA-01789
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = 20;

-- 집합 연산자(UNION)를 사용하여 출력하기(출력 열의 자료형이 다를 때): ORA-01790
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT ENAME, EMPNO, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20;

-- 집합 연산자(UNION)를 사용하여 출력하기(출력 열 개수와 자료형이 같을 때)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20;

-- 집합 연산자(UNION)를 사용하여 출력하기(출력 결과 데이터가 같을 때)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- 집합 연산자(UNION ALL)를 사용하여 출력하기(출력 결과 데이터가 같을 때)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- 집합 연산자(MINUS)를 사용하여 출력하기
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
         MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- 집합 연산자(INTERSECT)를 사용하여 출력하기
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;
