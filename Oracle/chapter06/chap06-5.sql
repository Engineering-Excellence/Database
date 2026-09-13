/* 자료형을 변환하는 형 변환 함수 */

-- 숫자와 문자열(숫자)을 더하여 출력하기
SELECT EMPNO
     , ENAME
     , EMPNO + '500' /* 암시적(자동) 형 변환 */
FROM EMP
WHERE ENAME = 'SCOTT';

/*
-- 문자열(문자)과 숫자를 더하여 출력하기
SELECT 'ABCD' + EMPNO -- ORA-01722: 수치가 부적합합니다
     , EMPNO
FROM EMP
WHERE ENAME = 'SCOTT';
 */

-- SYSDATE 날짜 형식 지정하여 출력하기
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간 /* 2026/09/13 14:07:14 */
FROM DUAL;

-- 월과 요일을 다양한 형식으로 출력하기
SELECT SYSDATE
     , TO_CHAR(SYSDATE, 'MM')    AS MM /* 09 */
     , TO_CHAR(SYSDATE, 'MON')   AS MON /* 9월 */
     , TO_CHAR(SYSDATE, 'MONTH') AS MONTH /* 9월 */
     , TO_CHAR(SYSDATE, 'DD')    AS DD /* 13 */
     , TO_CHAR(SYSDATE, 'DY')    AS DY /* 일 */
     , TO_CHAR(SYSDATE, 'DAY')   AS DAY /* 일요일 */
FROM DUAL;

-- 여러 언어로 날짜(월) 출력하기
SELECT SYSDATE
     , TO_CHAR(SYSDATE, 'MM')                                    AS MM /* 09 */
     , TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN')     AS MON_KOR /* 9월 */
     , TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE')   AS MON_JPN /* 9月 */
     , TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH')    AS MON_ENG /* SEP */
     , TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN')   AS MONTH_KOR /* 9월 */
     , TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN /* 9月 */
     , TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH')  AS MONTH_ENG /* SEPTEMBER */
FROM DUAL;

-- 여러 언어로 날짜(요일) 출력하기
SELECT SYSDATE
     , TO_CHAR(SYSDATE, 'MM')                                  AS MM /* 09 */
     , TO_CHAR(SYSDATE, 'DD')                                  AS DD /* 13 */
     , TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN')    AS DY_KOR /* 일 */
     , TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE')  AS DY_JPN /* 9日 */
     , TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH')   AS DY_ENG /* SUN */
     , TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN')   AS DAY_KOR /* 일요일 */
     , TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DAY_JPN /* 日曜日 */
     , TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH')  AS DAY_ENG /* SUNDAY */
FROM DUAL;

-- SYSDATE 시간 형식 지정하여 출력하기
SELECT SYSDATE
     , TO_CHAR(SYSDATE, 'HH24:MI:SS')    AS HH24MISS /* 14:05:20 */
     , TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM /* 02:05:20 오후 */
     , TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM /* 02:05:20 오후 */
FROM DUAL;

-- 여러 가지 숫자 형식을 사용하여 급여 출력하기
SELECT SAL /* 800.00 */
     , TO_CHAR(SAL, '$999,999')       AS SAL_$ /*      $800 */
     , TO_CHAR(SAL, 'L999,999')       AS SAL_L /*             ￦800 */
     , TO_CHAR(SAL, '999,999.00')     AS SAL_1 /*      800.00 */
     , TO_CHAR(SAL, '000,999,999.00') AS SAL_2 /*  000,000,800.00 */
     , TO_CHAR(SAL, '000999999.99')   AS SAL_3 /*  000000800.00 */
     , TO_CHAR(SAL, '999,999,00')     AS SAL_4 /*        8,00 */
FROM EMP;

-- 문자 데이터와 숫자 데이터를 연산하여 출력하기
SELECT 1300 - '1500' /* 암시적 형 변환 */
     , '1300' + 1500
FROM DUAL;

/*
-- 문자 데이터끼리 연산하여 출력하기
SELECT '1,300' - '1,500' -- ORA-01722: 수치가 부적합합니다(쉼표로 인해 암시적 형 변환 불가)
FROM DUAL;
 */

-- TO_NUMBER 함수로 연산하여 출력하기
SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999') /* 쉼표가 있어도 명시적 형 변환 가능 */
FROM DUAL;

-- TO_DATE 함수로 문자 데이터를 날짜 데이터로 변환하기
SELECT TO_DATE('2026-09-13', 'YYYY-MM-DD') AS TODATE1 /* 2026-09-13 */
     , TO_DATE('20260913', 'YYYY-MM-DD')   AS TODATE2 /* 2026-09-13 */
FROM DUAL;

-- 1981년 6월 1일 이후에 입사한 사원 정보 출력하기
SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

-- 여러 가지 형식으로 날짜 데이터 출력하기
SELECT TO_DATE('49/12/10', 'YY/MM/DD') AS YY_YEAR_49 /* 2049-12-10 */
     , TO_DATE('49/12/10', 'RR/MM/DD') AS RR_YEAR_49 /* 2049-12-10 */
     , TO_DATE('50/12/10', 'YY/MM/DD') AS YY_YEAR_50
     , TO_DATE('50/12/10', 'RR/MM/DD') AS RR_YEAR_50 /* 1950-12-10 */
     , TO_DATE('51/12/10', 'YY/MM/DD') AS YY_YEAR_51
     , TO_DATE('51/12/10', 'RR/MM/DD') AS RR_YEAR_51 /* 1951-12-10 */
FROM DUAL;
