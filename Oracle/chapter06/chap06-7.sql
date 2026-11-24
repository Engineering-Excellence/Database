/* 상황에 따라 다른 데이터를 반환하는 DECODE 함수와 CASE문 */

/*
-- DECODE 함수
DECODE([검사 대상이 될 열 또는 데이터, 연산이나 함수의 결과]
     , [조건1], [데이터가 조건1과 일치할 때 반환할 결과]
     , [조건2], [데이터가 조건1과 일치할 때 반환할 결과]
     , ...
     , [조건n], [데이터가 조건1과 일치할 때 반환할 결과]
     , [위 조건1~조건n과 일치하지 않을 때 반환할 결과])
 */

-- DECODE 함수를 사용하여 출력하기
SELECT EMPNO
     , ENAME
     , JOB
     , SAL
     , DECODE(JOB
    , 'MANAGER', SAL * 1.1
    , 'SALESMAN', SAL * 1.05
    , 'ANALYST', SAL
    , SAL * 1.03) AS UPSAL
FROM EMP;

/*
-- CASE문
CASE [검사 대상이 될 열 또는 데이터, 연산이나 함수의 결과(선택)
    WHEN [조건1] THEN [조건1의 결괏값이 true일 때 반환할 결과]
    WHEN [조건2] THEN [조건1의 결괏값이 true일 때 반환할 결과]
    ...
    WHEN [조건n] THEN [조건1의 결괏값이 true일 때 반환할 결과]
    ELSE [위 조건1~조건n과 일치하지 않을 때 반환할 결과]
END
 */

-- CASE문을 사용하여 출력하기
SELECT EMPNO
     , ENAME
     , JOB
     , SAL
     , CASE JOB
           WHEN 'MANAGER' THEN SAL * 1.1
           WHEN 'SALESMAN' THEN SAL * 1.05
           WHEN 'ANALYST' THEN SAL
           ELSE SAL * 1.03
    END AS UPSAL
FROM EMP;

-- 열에 따라서 출력이 달라지는 CASE문
SELECT EMPNO
     , ENAME
     , COMM
     , CASE
           WHEN COMM IS NULL THEN '해당사항 없음'
           WHEN COMM = 0 THEN '수당 없음'
           WHEN COMM > 0 THEN '수당: ' || COMM
    END AS COMM_TEXT
FROM EMP;
