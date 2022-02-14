--==============================================================================
--******************************************************************************
--FETCH
--******************************************************************************
--==============================================================================

--FETCH FIRST FIVE ROWS DEPTMENT WISE
SELECT EMPNO, ENAME, DNAME 
FROM EMP e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
ORDER BY DNAME
FETCH FIRST 5 ROWS ONLY;

--USING (WITH TIES)
SELECT EMPNO, ENAME, DNAME 
FROM EMP e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
ORDER BY DNAME
FETCH FIRST 5 ROWS WITH TIES;

--LIMIT BY PERCENTAGE OF ROWS
SELECT EMPNO, ENAME, DNAME 
FROM EMP e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
ORDER BY DNAME
FETCH NEXT 20 PERCENT ROWS ONLY;

--FETCH THE FIFTH HIGHEST SALARY AMONG ALL
SELECT DNAME, SAL+NVL(COMM,0) AS SALARY
FROM EMP e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
ORDER BY SALARY DESC,DNAME
OFFSET 1 ROWS
FETCH NEXT 1 ROW ONLY;