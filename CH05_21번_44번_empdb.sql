--21.
SELECT ename, job
FROM emp
WHERE job LIKE '_A%';

--22.
SELECT COUNT(*)
FROM emp
WHERE job = 'MANAGER';

--23.
SELECT AVG(sal)
FROM emp
WHERE deptno = 20;

--24.
SELECT MAX(sal)
FROM emp
WHERE deptno = 10;

--25.
SELECT MAX(sal)-MIN(sal)
FROM emp
WHERE job = 'MANAGER';

--26.
SELECT SUM(sal)
FROM emp
WHERE job = 'SALESMAN' OR
deptno = 30;

--27.
SELECT SUM(comm)
FROM emp;

--28.
SELECT AVG(sal)
FROM emp
WHERE hiredate  > '81/09/01';

--29.
SELECT SUM(SAL*1.2)
FROM emp;

--30.
SELECT SUM(SAL*1.2)-SUM(SAL)
FROM emp
WHERE job = 'SALESMAN';

--31.
SELECT job
FROM emp
ORDER BY job ASC;

--32.
SELECT ename, job, sal
FROM emp
ORDER BY sal DESC;

--33.
SELECT ename, deptno
FROM emp
WHERE job = 'SALESMAN'
ORDER BY hiredate;

--34.
SELECT empno, ename, sal
FROM emp
WHERE sal >= 1500 AND job = 'MANAGER'
ORDER BY ename ASC;

--35.
SELECT AVG(sal)
FROM emp
GROUP BY job;

--36.
SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno
ORDER BY AVG(sal) DESC;

--37.
SELECT deptno, MAX(sal)
FROM emp
GROUP BY deptno;

--38.
SELECT  job, sal
FROM emp
GROUP BY job, sal
ORDER BY job ASC, sal DESC;

--39.
SELECT mgr, COUNT(mgr), AVG(sal)
FROM emp
WHERE mgr IS NOT NULL
GROUP BY mgr;

--40.
SELECT job, MAX(sal), MIN(sal)
FROM emp
GROUP BY job;

--41.
SELECT job, COUNT(job), AVG(sal)
FROM emp
GROUP BY job
HAVING COUNT(*) >= 3;

--42.
SELECT deptno, COUNT(deptno), SUM(sal)
FROM emp
GROUP BY deptno;

--43.
SELECT deptno, COUNT(deptno), SUM(sal)
FROM emp
GROUP BY deptno
HAVING COUNT(*) >= 5;

--44.
SELECT deptno, COUNT(deptno), SUM(sal) 
FROM emp
WHERE hiredate >= '81/01/01'
GROUP BY deptno
HAVING SUM(sal) BETWEEN 9000 AND 10000
ORDER BY SUM(sal) DESC;