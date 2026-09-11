/* 날짜 데이터를 다루는 날짜 함수 */

-- SYSDATE 함수를 사용하여 날짜 출력하기
SELECT SYSDATE     AS NOW
     , SYSDATE - 1 AS YESTERDAY
     , SYSDATE + 1 AS TOMORROW
FROM DUAL;

-- SYSDATE와 ADD_MONTHS 함수로 3개월 후 날짜 구하기
SELECT SYSDATE
     , ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

-- 입사 10주년이 되는 사원들 데이터 출력하기
SELECT EMPNO
     , ENAME
     , HIREDATE
     , ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
FROM EMP;

-- 입사 40년 미만인 사원 데이터 출력하기
SELECT EMPNO
     , ENAME
     , HIREDATE
     , SYSDATE
FROM EMP
WHERE ADD_MONTHS(HIREDATE, 480) > SYSDATE;

-- HIREDATE와 SYSDATE 사이의 개월 수를 MONTHS_BETWEEN 함수로 출력하기
SELECT EMPNO
     , ENAME
     , HIREDATE
     , SYSDATE
     , MONTHS_BETWEEN(HIREDATE, SYSDATE)        AS MONTHS1 /* 소수로 출력 */
     , MONTHS_BETWEEN(SYSDATE, HIREDATE)        AS MONTHS2
     , TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3 /* 정수로 출력 */
FROM EMP;

-- NEXT_DAY, LAST_DAY 함수를 사용하여 출력하기
SELECT SYSDATE
     , NEXT_DAY(SYSDATE, '월요일')
     , LAST_DAY(SYSDATE)
FROM DUAL;

-- ROUND 함수 사용하여 날짜 데이터 출력하기
SELECT SYSDATE
     , ROUND(SYSDATE, 'CC')   AS FORMAT_CC /* 네 자리 연도의 끝 두자리를 기준으로 반올림 */
     , ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY /* 날짜 데이터의 해당 연·월·일의 7월 1일을 기준 */
     , ROUND(SYSDATE, 'Q')    AS FORMAT_Q /* 각 분기의 두 번째 달의 16일 기준 */
     , ROUND(SYSDATE, 'DDD')  AS FORMAT_DDD /* 해당 일의 정오(12:00:00)를 기준 */
     , ROUND(SYSDATE, 'HH')   AS FORMAT_HH /* 해당 일의 시간을 기준 */
FROM DUAL;

-- TRUNC 함수 사용하여 날짜 데이터 출력하기
SELECT SYSDATE
     , TRUNC(SYSDATE, 'CC')   AS FORMAT_CC /* 네 자리 연도의 끝 두자리를 기준으로 반올림 */
     , TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY /* 날짜 데이터의 해당 연·월·일의 7월 1일을 기준 */
     , TRUNC(SYSDATE, 'Q')    AS FORMAT_Q /* 각 분기의 두 번째 달의 16일 기준 */
     , TRUNC(SYSDATE, 'DDD')  AS FORMAT_DDD /* 해당 일의 정오(12:00:00)를 기준 */
     , TRUNC(SYSDATE, 'HH')   AS FORMAT_HH /* 해당 일의 시간을 기준 */
FROM DUAL;
