/* 5장 잊기 전에 한 번 더! */

/* Q1: 사원 이름이 S로 끝나는 사원 데이터를 모두 출력 */
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

/* Q2: 30번 부서에서 근무하고 있는 사원 중에 직책이 SALESMAN인 사원 정보 일부를 출력 */
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
  AND JOB = 'SALESMAN';

/* Q3: 20번, 30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원 정보 일부를 출력 */
-- 집합 연산자를 사용하지 않은 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30)
  AND SAL > 2000;
-- 집합 연산자를 사용한 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20
  AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
  AND SAL > 2000;

/* Q4: BETWEEN 연산자를 쓰지 않고 급여 열 값이 2000 이상 3000 이하 범위 이외의 값을 가진 데이터만 출력 */
SELECT *
FROM EMP
WHERE SAL < 2000
   OR SAL > 3000;

/* Q5: 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000~2000 사이가 아닌 사원 정보 일부를 출력 */
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%'
  AND DEPTNO = 30
  AND SAL NOT BETWEEN 1000 AND 2000;

/* Q6: 추가 수당이 존재하지 않고 상급자가 있고 직책이 MANAGER, CLERK인 사원 중 사원 이름의 두 번째 글자가 L이 아닌 사원의 정보를 출력 */
SELECT *
FROM EMP
WHERE COMM IS NULL
  AND MGR IS NOT NULL
  AND JOB IN ('MANAGER', 'CLERK')
  AND ENAME NOT LIKE '_L%';