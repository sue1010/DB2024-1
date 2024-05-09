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
from emp, dept
where emp.deptno = dept.deptno
and dept.dname = 'RESEARCH'
and emp.hiredate > '1981-05-01';

--13.
select emp.ename, emp.job, emp.sal
from emp, dept
where emp.deptno = dept.deptno
and dept.dname = 'ACCOUNTING' 
and emp.sal >= 2000;

--14.
select dept.loc, sum(emp.sal)
from emp, dept
where emp.deptno = dept.deptno
group by dept.loc;

--15.
select max(emp.sal)-min(emp.sal)
from emp, dept
where emp.deptno = dept.deptno
and dept.loc = 'DALLAS';

--16.
select e.ename as employee, m.ename as manager
from emp e, emp m
where e.mgr = m.empno
order by manager;

--17.
select m.ename as manager, count(*)
from emp e, emp m
where e.mgr = m.empno
group by m.ename;

--18.
select m.ename as manager, sum(e.sal) as summary_sal, d.loc as loc
from emp e, emp m, dept d
where e.mgr = m.empno
and m.deptno = d.deptno
group by m.ename, d.loc;

--19.
select m.ename as manager, e.ename, e.sal
from emp e, emp m
where e.mgr = m.empno
and e.job = 'CLERK'
order by m.ename;

--20.
select e.ename,  e.sal, m.ename
from emp e, emp m
where  e.mgr = m.empno
and e.sal > m.sal;

--21.
select ename, hiredate, deptno
from emp
where deptno = '10'
union
select ename, hiredate, deptno
from emp 
where deptno = '20';

--22.
select ename, sal
from emp
where job = 'CLERK'
intersect
select ename, sal
from emp
where sal >= 1000;

--23.
select ename, job, sal
from emp
where sal >= 1000
minus
select ename, job, sal
from emp
where job IN ('MANAGER', 'PRESIDENT');

--24.
select e.ename, e.sal, d.dname
from emp e, dept d
where e.deptno = d.deptno
and e.sal = (select min(sal)
            from emp);
            
--25.
select e.ename, e.sal, d.loc
from emp e, dept d
where e.deptno = d.deptno
and e.sal >= (select avg(sal)
                from emp);
                
--26.
select m.ename as manager
from emp e, emp m
where e.mgr = m.empno
and e.sal = (select min(sal)
            from emp);
            
--27.
select ename, sal
from emp
where sal in (select min(sal) from emp
                    union
                   select max(sal) from emp);
                   
--28.
select sum(sal)
from emp
where sal not in (select min(sal) from emp
                    union
                   select max(sal) from emp);
                   
--29.
select e.ename, e.job
from emp e
where e.job in (select e1.job
           from emp e1, dept d1
            where e1.deptno = d1.deptno
            and d1.dname = 'SALES')
and e.deptno not in (select d2.deptno
                from dept d2
                where d2.dname = 'SALES');

--30.
select e.ename, d.dname, e.sal
from emp e, dept d
where e.deptno = d.deptno
and e.sal <= (select avg(sal)-500
            from emp e1);
            
--31.
select ename, job, hiredate
from emp
where hiredate < (select hiredate
                        from emp
                        where ename = 'JAMES');
                        
--32.
select count(*)
from emp
where sal > (select sal
        from emp
        where ename = 'ADAMS');

--33.
select ename, sal
from emp
where sal between(select sal
                        from emp
                        where ename = 'SMITH')
                and (select sal
                        from emp
                        where ename = 'FORD');
                        
--34.
select dname, loc
from dept 
where deptno in (select deptno
        from emp
        group by deptno
        having count(*) >= 4);
        
--35.
select dname, loc
from dept 
where deptno in (select deptno
        from emp
        group by deptno
        having count(*) <= 3);
        
--36.
select ename, job
from emp
where hiredate = ANY(select e.hiredate
                            from emp e, dept d
                            where e.deptno = d.deptno
                            and d.dname = 'RESEARCH')
and deptno in (select deptno
                                from dept
                                where dname <> 'RESEARCH');
 ------------------------------------------------------------
 
--37.
select ename, job, deptno
from emp
where hiredate > all(select e.hiredate
                            from emp e, dept d
                            where e.deptno = d.deptno
                            and d.dname = 'SALES');

--38.
select language, percentage
from countrylanguage, country
where countrylanguage.countrycode = country.code
and country.name = 'France';

--39.
select language, percentage
from countrylanguage, country
where countrylanguage.countrycode = country.code
and country.name = 'Italy'
and countrylanguage.percentage >= 10;

--40.
select c.name, c.population, cl.language
from countrylanguage cl, country c
where cl.countrycode = c.code
order by c.population desc;

--41.
select c.name, c.surfacearea, count(cl.language)
from countrylanguage cl, country c
where cl.countrycode = c.code
and c.surfacearea >=300000
group by c.name, c.surfacearea;

--42.
select c.name, cl.percentage
from countrylanguage cl, country c
where cl.countrycode = c.code
and cl.percentage >20
and cl.language = 'French';

--43.
select c.name, c.population, cl.percentage
from countrylanguage cl, country c
where cl.countrycode = c.code
and cl.language = 'Spanish';

--44.
select ct.name, ct.population
from city ct, country c
where ct.countrycode = c.code
and c.name = 'Italy'
and ct.population >= 500000;

--45.
select ct.district, count(ct.id)
from city ct, country c
where ct.countrycode = c.code
and c.name = 'United Kingdom'
group by ct.district;

--46.
select c.name, c.population, sum(ct.population)
from city ct, country c
where ct.countrycode = c.code
group by c.name, c.population
having c.population*0.3 <=  sum(ct.population);
-------------------------------------------------------
--47.
select name, population
from country
where population = (select max(population)
                        from country);

--48.                        
select name, population
from country
where population = (select min(population)
                        from country);
                        
--49.
select name, population
from country 
where population <= (select avg(population)
                                from country);
                                
--50.
select c.name, cl.language
from country c, countrylanguage cl
where c.code = cl.countrycode
and cl.language in (select cl1.language
                            from country c1, countrylanguage cl1
                            where c1.code = cl1.countrycode
                            and c1.name = 'France'
                            and cl1.percentage >= 1)
and cl.countrycode not in ( select cl2. countrycode
                            from country c2, countrylanguage cl2
                            where c2.code = cl2.countrycode
                            and c2.name = 'France');
                            
--51.
select c.name, ct.name
from country c, city ct
where c.code = ct.countrycode
and ct.name = (select name
                from city
                group by name
                having count(*) >1);
                
--52.
select c.name, ct.name
from country c, city ct
where c.code = ct.countrycode
and ct.population >= 500000
and c.code in (select countrycode
                from countrylanguage
                where language = 'English');
                
--53.
select c.name, c.population, count(*)
from country c, city ct
where c.code = ct.countrycode
and c.population between (select population
                                        from country
                                        where name = 'Spain')
                        and (select population
                                        from country
                                        where name = 'France')
group by c.name, c.population;

--54.
select cl.language, c.name
from country c, countrylanguage cl
where c.code = cl.countrycode
and cl.language in (select language
                        from countrylanguage
                        group by language
                        having count(*) >= 10);
 
-- 55.
select name, surfacearea, population
from country
where surfacearea >= 400000
UNION
select name, surfacearea, population
from country
where population >= 50000000;

--56.
select name, surfacearea, population
from country
where surfacearea >= 300000
INTERSECT
select c.name, c.surfacearea, c.population
from country c, city ct
where c.code = ct.countrycode
group by c.name, c.surfacearea, c.population
having count(ct.id) >= 10;

--57.
select name, population
from country
where population >= 50000000
MINUS
select c.name, c.population
from country c, countrylanguage cl
where c.code = cl.countrycode
group by c.name, c.population
having count(cl.language) <= 3;

--58.
select name   
from country c
where EXISTS (SELECT 1
                    from countrylanguage cl
                    where cl.countrycode = c.code
                    and cl.percentage >= 98);

--59.
select c.name
from country c
where c.code <> 'FRA'
and EXISTS(select 1
                 from countrylanguage cl
                 where cl.countrycode= 'FRA'
                  and cl.language = ANY( select cl1.language
                                                    from countrylanguage cl1
                                                    where cl1.countrycode = c.code)
                );
                
--60.
select ct.name, ct.population
from city ct
where ct.population > ALL(select ct1.population
                                        from city ct1, country c
                                        where ct1.countrycode = c.code
                                        and c.name = 'France');
                
                
                
