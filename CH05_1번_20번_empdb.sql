----연습문제 1-10
----A1
--CREATE
----A2.
--SELECT
----A3.
--INSERT
----A4.
--DELETE
----A5. 
--GRANT
select *
from emp;
SELECT * 
from dept;


--6.
SELECT dname
from dept
WHERE loc = 'BOSTON';

--7.
SELECT ename, hiredate
FROM emp
WHERE job = 'ANALYST';

--8
SELECT ename, hiredate
FROM emp
WHERE deptno = 10;

--9.
SELECT DISTINCT empno
FROM emp
WHERE job = 'MANAGER';

--10.
SELECT *
FROM emp
WHERE job = 'ANALYST';

--11.
SELECT ename, sal
FROM emp
WHERE sal BETWEEN 3000 AND 4000;

--12.
SELECT ename, hiredate
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/06/30';

--13.
SELECT empno, ename, deptno
FROM emp
WHERE deptno IN (10, 20);

--14.
SELECT ename
FROM emp
WHERE job = 'PRESIDENT';

--15. 
SELECT ename, job
FROM emp
WHERE job != 'CLERK';

--16.
SELECT ename, sal
FROM emp
WHERE sal BETWEEN 3000 AND 4000 OR
 job = 'CLERK';
 
-- 17.
SELECT ename
FROM emp
WHERE deptno = 20 AND 
job = 'CLERK' AND
mgr = 7902;

--18.
SELECT ename, job, sal
FROM emp
WHERE job IN ('ANALYST', 'CLERK', 'MANAGER');

--19.
SELECT ename, job, sal
FROM emp
WHERE job NOT IN('ANALYST', 'MANAGER', 'SALESMAN');

--20.
SELECT ename, job
FROM emp
WHERE job LIKE '%NA%';