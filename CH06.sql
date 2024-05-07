--8.
SELECT emp.ename, dept.dname, emp.job
FROM emp, dept
WHERE emp.deptno = dept.deptno 
AND dept.loc = 'DALLAS';

--9
select emp.ename, emp.sal, dept.loc
from emp, dept
where emp.deptno = dept.deptno
and dept.loc = 'DALLAS' 
and emp.sal <= 4000;

--10
select dept.loc
from emp, dept
where emp.deptno = dept.deptno
and emp.job = 'PRESIDENT';

--11
select emp.ename, emp.job
from emp, dept
where emp.deptno = dept.deptno
and dept.dname = 'SALES';

--12.
select emp.ename, emp.sal, emp.hiredate
