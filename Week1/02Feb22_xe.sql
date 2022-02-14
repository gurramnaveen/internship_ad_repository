
ALTER TABLE
    EMP
DROP COLUMN
    BRANCHNO;
--******************************************************************************
--JOIN
--******************************************************************************
--******************************************************************************
    SELECT
        e.ENAME, d.DNAME, b.LOCATION
    FROM
        EMP e, DEPT d, BRANCH b
    WHERE
        e.DEPTNO=d.DEPTNO AND d.BRANCHNO=b.BRANCHNO;

------------------------------------------------------------
    SELECT
        E.ENAME, D.DNAME, B.LOCATION
    FROM
        EMP E JOIN DEPT D
        ON E.DEPTNO=D.DEPTNO
        JOIN BRANCH B
        ON D.BRANCHNO=B.BRANCHNO;

--******************************************************************************
-- LIST ENAME JOB MGR HIREDATE SAL DNAME
-- EMP [ENAME JOB MGR HIREDATE SAL DNAME]
-- DEPT [DNAME]
-- EMP.DEPTNO=DEPT.DEPTNO
--******************************************************************************

    SELECT
        E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, D.DNAME
    FROM
        EMP E JOIN DEPT D
        ON E.DEPTNO=D.DEPTNO;

--******************************************************************************
-- LIST ALL THE EMPLOYEES SUCH AS ENAME JOB MGR HIREDATE SAL DNAME
-- LEFT JOIN TO DEPT TABLE
-- ALL THE EMPLOYEES EVEN IF ANY EMPLOYEE DOES NOT HAVE ANY DEPT
-- EMP [ENAME JOB MGR HIREDATE SAL DNAME]
-- DEPT [DNAME]
-- EMP.DEPTNO=DEPT.DEPTNO
--******************************************************************************

    SELECT
        E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, D.DNAME
    FROM
        EMP E LEFT OUTER JOIN DEPT D
        ON E.DEPTNO=D.DEPTNO;
        
-----------------------------------------------------------------    
    SELECT
        E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, D.DNAME
    FROM
        EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO(+);

--******************************************************************************
-- LIST ALL THE EMPLOYEES SUCH AS ENAME JOB MGR HIREDATE SAL DNAME
-- RIGHT JOIN TO DEPT TABLE
-- ALL THE EMPLOYEES EVEN IF ANY EMPLOYEE DOES NOT HAVE ANY DEPT
-- EMP [ENAME JOB MGR HIREDATE SAL DNAME]
-- DEPT [DNAME]
-- EMP.DEPTNO=DEPT.DEPTNO
--******************************************************************************

    SELECT
        E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, D.DNAME
    FROM
        EMP E RIGHT OUTER JOIN DEPT D
        ON E.DEPTNO=D.DEPTNO;
        
---------------------------------------------------------    
    SELECT
        E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, D.DNAME
    FROM
        EMP E, DEPT D
    WHERE E.DEPTNO(+)=D.DEPTNO;

--******************************************************************************
-- LIST ALL THE EMPLOYEES SUCH AS ENAME JOB MGR HIREDATE SAL DNAME
-- FULL OUTER JOIN TO DEPT TABLE
-- ALL THE EMPLOYEES EVEN IF ANY EMPLOYEE DOES NOT HAVE ANY DEPT
-- EMP [ENAME JOB MGR HIREDATE SAL DNAME]
-- DEPT [DNAME]
-- EMP.DEPTNO=DEPT.DEPTNO
--******************************************************************************

    SELECT
        E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, D.DNAME
    FROM
        EMP E FULL OUTER JOIN DEPT D
        ON E.DEPTNO=D.DEPTNO;

--******************************************************************************
-- ENAME JOB SAL BRANCHNAME
-- EMP
-- BRANCH
--******************************************************************************

    SELECT
        ENAME, JOB, SAL, BRANCHNAME
    FROM
        EMP E JOIN DEPT D
        ON E.DEPTNO=D.DEPTNO
        JOIN BRANCH B
        ON D.BRANCHNO=B.BRANCHNO;

--******************************************************************************
--LIST ALL DNAME AND EMP COUNT FRO EACH DEPT
--******************************************************************************

    SELECT
        DNAME, COUNT(EMPNO)
    FROM
        DEPT d JOIN EMP e 
        ON d.DEPTNO = e.DEPTNO
    GROUP BY
        DNAME;

--******************************************************************************
-- --LIST ALL BRANCHNAME AND EMP COUNT FRO EACH BRANCH
--******************************************************************************

    SELECT
        BRANCHNAME, COUNT(EMPNO)
    FROM
        BRANCH b JOIN DEPT d
        ON b.BRANCHNO=d.BRANCHNO
        JOIN EMP e
        ON e.DEPTNO=d.DEPTNO
    GROUP BY
        BRANCHNAME;
        
--******************************************************************************
-- LIST BRANCHNAME,DNAME,SUM OF SAL FOR THOSE BRANCH AND DEPT WHERE THE SUM IS >5000
--******************************************************************************

    SELECT
        BRANCHNAME, DNAME, SUM(SAL)
    FROM
        BRANCH b JOIN DEPT d
        ON d.BRANCHNO=b.BRANCHNO
        JOIN EMP e
        ON e.DEPTNO=d.DEPTNO
    GROUP BY
        BRANCHNAME, DNAME
    HAVING
        SUM(SAL) > 5000;

--******************************************************************************
-- SELF JOIN
--******************************************************************************

    SELECT
        e.EMPNO, e.ENAME, e.MGR, m.ENAME
    FROM
        EMP e JOIN EMP m
        ON m.EMPNO=e.MGR;

--******************************************************************************
--******************************************************************************
--******************************************************************************
--******************************************************************************
--******************************************************************************
--******************************************************************************
--******************************************************************************
--******************************************************************************
--******************************************************************************
--******************************************************************************
--******************************************************************************
