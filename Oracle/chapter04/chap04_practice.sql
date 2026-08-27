/* 4장 잊기 전에 한 번 더! */

/* Q2: EMP 테이블의 JOB 열 데이터를 중복 없이 출력 */
SELECT DISTINCT JOB
FROM EMP;

/* Q3: 조건을 만족하는 SQL문을 작성 */
SELECT EMPNO  AS EMPLOYEE_NO,
       ENAME  AS EMPLOYEE_NAME,
       JOB,
       MGR    AS MANAGER,
       HIREDATE,
       SAL    AS SALARY,
       COMM   AS COMMISSION,
       DEPTNO AS DEPARTMENT_NO
FROM EMP
ORDER BY DEPTNO DESC, ENAME;
