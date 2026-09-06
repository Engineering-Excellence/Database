/* 숫자 데이터를 연산하고 수치를 조정하는 숫자 함수 */

-- ROUND 함수를 사용하여 반올림된 숫자 출력하기
SELECT ROUND(1234.5678)     AS ROUND, /* ROUND_0과 동일 */
       ROUND(1234.5678, 0)  AS ROUND_0, /* 소수점 0번째 자리(일의 자리)까지 출력 */
       ROUND(1234.5678, 1)  AS ROUND_1, /* 소수점 1번째 자리까지 출력 */
       ROUND(1234.5678, 2)  AS ROUND_2,
       ROUND(1234.5678, -1) AS ROUND_MINUS1, /* 소수점 -1번째 자리(십의 자리)까지 유효 출력 */
       ROUND(1234.5678, -2) AS ROUND_MINUS2 /* 소수점 -2번째 자리(백의 자리)까지 유효 출력 */
FROM DUAL;

-- TRUNC 함수를 사용하여 숫자 출력하기
SELECT TRUNC(1234.5678)     AS TRUNC, /* TRUNC_0과 동일 */
       TRUNC(1234.5678, 0)  AS TRUNC_0, /* 소수점 0번째 자리(일의 자리)까지 출력 */
       TRUNC(1234.5678, 1)  AS TRUNC_1, /* 소수점 1번째 자리까지 출력 */
       TRUNC(1234.5678, 2)  AS TRUNC_2,
       TRUNC(1234.5678, -1) AS TRUNC_MINUS1, /* 소수점 -1번째 자리(십의 자리)까지 유효 출력 */
       TRUNC(1234.5678, -2) AS TRUNC_MINUS2 /* 소수점 -2번째 자리(백의 자리)까지 유효 출력 */
FROM DUAL;

-- CEIL, FLOOR 함수로 숫자 출력하기
SELECT CEIL(3.14),
       FLOOR(3.14),
       CEIL(-3.14),
       FLOOR(-3.14)
FROM DUAL;

-- MOD 함수를 사용하여 나머지 값 출력하기
SELECT MOD(15, 6),
       MOD(10, 2),
       MOD(11, 2)
FROM DUAL;
