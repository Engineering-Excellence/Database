/* NULL 처리 함수 */

/*
-- NVL 함수의 기본 사용법
NVL([NULL인지 여부를 검사할 데이터 또는 열(필수)],
    [앞의 데이터가 NULL일 때 반환할 데이터(필수)])
 */

-- NVL 함수를 사용하여 출력하기
SELECT EMPNO
     , ENAME
     , SAL
     , COMM
     , SAL + COMM
     , NVL(COMM, 0)
     , SAL + NVL(COMM, 0)
FROM EMP;

/*
-- NVL2 함수의 기본 사용법
NVL2([NULL인지 여부를 검사할 데이터 또는 열(필수)],
     [앞의 데이터가 NULL이 아닐 때 반환할 데이터 또는 계산식(필수)])
     [앞의 데이터가 NULL일 때 반환할 데이터 또는 계산식(필수)])
 */

SELECT EMPNO
     , ENAME
     , COMM
     , NVL2(COMM, 'O', 'X')
     , NVL2(COMM, SAL * 12 + COMM, SAL * 12) AS ANNSAL
FROM EMP;
