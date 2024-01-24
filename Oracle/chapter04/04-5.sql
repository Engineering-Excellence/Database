-- 한눈에 보기 좋게 별칭 설정하기

-- 열에 연산식을 사용하여 출력하기
SELECT ENAME, SAL, SAL * 12 + COMM, COMM
FROM EMP;

-- 곱하기를 사용하지 않고 사원의 연간 총 수입 출력하기
SELECT ENAME, SAL, SAL + SAL + SAL + SAL + SAL + SAL + SAL + SAL + SAL + SAL + SAL + SAL + COMM, COMM
FROM EMP;

-- 별칭을 사용하여 사원의 연간 총 수입 출력하기
SELECT ENAME, SAL, SAL * 12 + COMM AS ANNSAL, COMM
FROM EMP;
