-- 여러 개 조건식을 사용하는 AND, OR 연산자

-- AND 연산자로 여러 개의 조건식 사용하기
SELECT *
FROM EMP
WHERE DEPTNO = 30
  AND JOB = 'SALESMAN';

-- OR 연산자로 여러 개의 출력 조건 사용하기
SELECT *
FROM EMP
WHERE DEPTNO = 30
   OR JOB = 'CLERK';
