/* 문자 데이터를 가공하는 문자 함수 */

-- UPPER, LOWER, INITCAP 함수 사용하기
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

-- UPPER 함수로 문자열 비교하기(사원 이름이 SCOTT인 데이터 찾기)
SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('scott');

-- UPPER 함수로 문자열 비교하기(사원 이름에 SCOTT 단어를 포함한 데이터 찾기)
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%scott%');

-- 선택한 열의 문자열 길이 구하기
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

-- 사원 이름의 길이가 5 이상인 행 출력하기
SELECT ENAME, LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME) >= 5;

-- LENGTH 함수와 LENGTHB 함수 비교하기
SELECT LENGTH('한글'), LENGTHB('한글') /* LENGTHB()는 바이트 수를 반환, 한글 글자당 3바이트(유니코드) */
FROM DUAL/* DUAL: 최고 권한 관리자 계정 SYS 소유의 더미 테이블 */;

-- SUBSTR 함수를 사용하는 예
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5), SUBSTR(JOB, -2)
FROM EMP;

-- SUBSTR 함수 안에 다른 함수(LENGTH) 함께 사용하기
SELECT JOB, SUBSTR(JOB, -LENGTH(JOB)), SUBSTR(JOB, -LENGTH(JOB), 2), SUBSTR(JOB, -3)
FROM EMP;

/*
문자열 데이터 안에서 특정 문자 위치를 찾는 INSTR 함수

INSTR([대상 문자열 데이터(필수)],
      [위치를 찾으려는 부분 문자(필수)],
      [위치 찾기를 시작할 대상 문자열 데이터 위치(선택, 기본값 1)],
      [시작 위치에서 찾으려는 문자가 몇 번째인지 지정(선택, 기본값 1)])
 */

-- INSTR 함수로 문자열 데이터에서 특정 문자열 찾기
SELECT INSTR('HELLO, ORACLE!', 'L')       AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L', 5)    AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3,
       INSTR('HELLO, ORACLE!', 'Z')       AS INSTR_4 /* 찾을 문자가 없으면 0을 반환 */
FROM DUAL;

-- INSTR 함수로 사원 이름에 문자 S가 있는 행 구하기
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S') > 0;

-- LIKE 연산자로 사원 이름에 문자 S가 있는 행 구하기
SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';

/*
특정 문자를 다른 문자로 바꾸는 REPLACE 함수

REPLACE([문자열 데이터 또는 열 이름(필수)], [찾는 문자(필수)], 대체할 문자(선택)])
 */

-- REPLACE 함수로 문자열 안에 있는 특정 문자 바꾸기
SELECT '010-1234-5678'                    AS REPLACE_BEFORE,
       REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
       REPLACE('010-1234-5678', '-')      AS REPLACE_2 /* 대체문자 비지정시 삭제 */
FROM DUAL;

/*
데이터의 빈 공간을 특정 문자로 채우는 LPAD, RPAD 함수

LPAD([문자열 데이터 또는 열이름(필수)], [데이터의 자릿수(필수)], [빈 공간에 채울 문자(선택)])
RPAD([문자열 데이터 또는 열이름(필수)], [데이터의 자릿수(필수)], [빈 공간에 채울 문자(선택)])
 */

-- LPAD, RPAD 함수 사용하여 출력하기
SELECT 'Oracle',
       LPAD('Oracle', 10, '#') AS LPAD_1,
       RPAD('Oracle', 10, '*') AS RPAD_1,
       LPAD('Oracle', 10)      AS LPAD_2,
       RPAD('Oracle', 10)      AS RPAD_2
FROM DUAL;

-- RPAD 함수를 사용하여 개인정보 뒷자리 * 표시로 출력하기
SELECT RPAD('971225-', 14, '*')   AS RPAD_JMNO,
       RPAD('010-1234-', 13, '*') AS RPAD_PHONE
FROM DUAL;

-- 두 열 사이에 콜론(:) 넣고 연결하기
SELECT CONCAT(EMPNO, ENAME), CONCAT(EMPNO, CONCAT(': ', ENAME))
FROM EMP
WHERE ENAME = 'SCOTT';

-- || 연산자 사용
SELECT EMPNO || ENAME, EMPNO || ': ' || ENAME
FROM EMP
WHERE ENAME = 'SCOTT';

/*
특정 문자를 지우는 TRIM, LTRIM, RTRIM 함수

TRIM([삭제 옵션(선택)] [삭제할 문자(선택)] FROM [원본 문자열 데이터(필수)])
LTRIM([원본 문자열 데이터(필수)], [삭제할 문자 집합(선택)])
RTRIM([원본 문자열 데이터(필수)], [삭제할 문자 집합(선택)])
 */

-- TRIM 함수로 공백 제거하여 출력하기
SELECT '[' || TRIM(' _ _Oracle_ _ ') || ']'               AS TRIM, /* 공백 삭제 */
       '[' || TRIM(LEADING FROM ' _ _Oracle_ _ ') || ']'  AS TRIM_LEADING, /* 왼쪽 공백 삭제 */
       '[' || TRIM(TRAILING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_TRAILING, /* 오른쪽 공백 삭제 */
       '[' || TRIM(BOTH FROM ' _ _Oracle_ _ ') || ']'     AS TRIM_BOTH /* 양쪽 공백 삭제 */
FROM DUAL;

-- TRIM 함수로 삭제할 문자 _ 삭제 후 출력하기
SELECT '[' || TRIM('_' FROM '_ _Oracle_ _') || ']'          AS TRIM, /* '_' 삭제 */
       '[' || TRIM(LEADING '_' FROM '_ _Oracle_ _') || ']'  AS TRIM_LEADING, /* 왼쪽 '_' 삭제 */
       '[' || TRIM(TRAILING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_TRAILING, /* 오른쪽 '_' 삭제 */
       '[' || TRIM(BOTH '_' FROM '_ _Oracle_ _') || ']'     AS TRIM_BOTH /* 양쪽 '_' 삭제 */
FROM DUAL;

-- TRIM, LTRIM, RTRIM 사용하여 문자열 출력하기
SELECT '[' || TRIM(' _Oracle_ ') || ']'        AS TRIM,
       '[' || LTRIM(' _Oracle_ ') || ']'       AS LTRIM,
       '[' || LTRIM('<_Oracle_>', '_<') || ']' AS LTRIM_2, /* _, <로 가능한 모든 문자 조합을 왼쪽부터 삭제 */
       '[' || RTRIM(' _Oracle_ ') || ']'       AS RTRIM,
       '[' || RTRIM('<_Oracle_>', '>_') || ']' AS RTRIM_2 /* >, _로 가능한 모든 문자 조합을 오른쪽부터 삭제 */
FROM DUAL;
