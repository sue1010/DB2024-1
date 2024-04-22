SELECT job
FROM emp;

SELECT DISTINCT job
FROM emp;

SELECT ename, job, sal
FROM emp
WHERE not(job = 'SALESMAN' OR job = 'ANALYST');

SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

SELECT ename, job, sal
FROM emp
WHERE sal IN (1000, 2000, 3000);

SELECT ename, job
FROM emp
WHERE ename LIKE 'A%';

SELECT ename, job
FROM emp
WHERE ename LIKE '__A%';

--/연습문제 16.
SELECT ename, sal
FROM emp
WHERE (SAL BETWEEN 3000 AND 4000)
OR (JOB = 'CLERK');

--/연습문제 20.
SELECT ename, job
FROM emp
WHERE job LIKE '%NA%';

--/연습문제 21.
SELECT ename, job
FROM emp
WHERE job LIKE '_A%';

SELECT COUNT(*)
FROM emp
WHERE job = 'SALESMAN';

SELECT COUNT(*) AS "cnt salesman"
FROM emp
WHERE job = 'SALESMAN';

SELECT deptno, COUNT(*) AS cnt_emp
FROM emp
GROUP BY deptno
HAVING COUNT(*) >= 5;

SELECT deptno, COUNT(*) AS cnt_emp
FROM emp
GROUP BY deptno
HAVING cnt_emp >= 5;

