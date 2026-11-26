/* 6장 되새김 문제 */

/* Q1. */
SELECT EMPNO
     , RPAD(SUBSTR(EMPNO, 1, 2), LENGTH(EMPNO), '*') AS MASKING_EMPNO
     , ENAME
     , RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) = 5;

/* Q2. */
SELECT EMPNO
     , ENAME
     , SAL
     , TRUNC(SAL / 21.5, 2)     AS DAY_PAY
     , ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
FROM EMP;

/* Q3. */
SELECT EMPNO
     , ENAME
     , HIREDATE
     , TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JOB
     , NVL(TO_CHAR(COMM), 'N/A')                                       AS COMM
FROM EMP;

/* Q4. */
SELECT EMPNO
     , ENAME
     , MGR
     , CASE
           WHEN MGR IS NULL THEN '0000'
           WHEN MGR LIKE '75%' THEN '5555'
           WHEN MGR LIKE '76%' THEN '6666'
           WHEN MGR LIKE '77%' THEN '7777'
           WHEN MGR LIKE '78%' THEN '8888'
           ELSE TO_CHAR(MGR)
    END AS CHG_MGR
FROM EMP;
