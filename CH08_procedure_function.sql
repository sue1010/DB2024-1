--9
CREATE OR REPLACE PROCEDURE p_cntry(eid VARCHAR2)
AS
    v_surface country.surfacearea%TYPE;
    v_population country.population%TYPE;
    v_life country.lifeexpectancy%TYPE;
BEGIN
    SELECT c.surfacearea, c.population, c.lifeexpectancy INTO v_surface, v_population, v_life
    FROM country c
    WHERE c.name = eid;
    
    DBMS_OUTPUT.PUT_LINE('면적 : ' || v_surface || '  인구 : ' || v_population || '  기대 수명 : ' || v_life );
    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

SET SERVEROUTPUT ON;
EXEC p_cntry('France');

--10
CREATE OR REPLACE PROCEDURE p_emp_sal(eid number)
AS
    v_dname dept.dname%TYPE;
    v_sal emp.sal%TYPE;
BEGIN
    SELECT d.dname, SUM(e.sal) INTO v_dname, v_sal
    FROM emp e, dept d
    WHERE d.deptno = e.deptno
    GROUP BY d.deptno, d.dname
    HAVING d.deptno = eid;
    
    DBMS_OUTPUT.PUT_LINE( '부서명 : ' || v_dname || '  급여 합계 : ' || v_sal );
    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
SET SERVEROUTPUT ON;
EXEC p_emp_sal(20);

--11
CREATE OR REPLACE FUNCTION f_dept_name(in_value number)
    RETURN VARCHAR2
AS
    v_dname dept.dname%TYPE;
BEGIN
    SELECT dname INTO v_dname
    FROM dept
    WHERE deptno = in_value;
    
    RETURN v_dname;
END;
/

SELECT e.ename, f_dept_name(d.deptno), d.dname, e.job, e.sal 
FROM emp e, dept d
WHERE d.deptno = e.deptno   
AND e.sal >= 1500;

--12
CREATE OR REPLACE FUNCTION f_mgr(in_value number)
    RETURN VARCHAR2
AS
    v_mgr emp.mgr%TYPE;
BEGIN 
    SELECT mgr INTO v_mgr
    FROM emp
    WHERE empno = in_value;
    
    RETURN v_mgr;
END;
/
SELECT ename, f_mgr(empno), job, sal
FROM emp
WHERE hiredate > '1981-05-01';