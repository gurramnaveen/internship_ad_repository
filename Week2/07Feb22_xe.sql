CREATE VIEW vw_empdetails
    AS
SELECT
    e.empno,e.ename,e.job,e.sal,d.dname,b.location
FROM
    emp e join dept d
    ON e.deptno=d.deptno
    JOIN branch b
    ON b.branchno=d.branchno
ORDER BY d.deptno;

SELECT * FROM vw_empdetails;

SELECT 
    e.ENAME, m.ENAME, e.DEPTNO
FROM
    EMP e JOIN EMP m
    ON e.MGR=m.EMPNO;
    
CREATE VIEW vw_mgrdetails(ENAME, MGRNAME, DEPTNO)
    AS
SELECT 
    e.ENAME, m.ENAME, e.DEPTNO
FROM
    EMP e JOIN EMP m
    ON e.MGR=m.EMPNO;
    
SELECT * FROM vw_mgrdetails;


[5:04 PM] Dhanashree Jawle
SELECT
    DEPTNO,EMPNO,ENAME,JOB,SAL,COMM
FROM
    EMP
ORDER BY
    DEPTNO,EMPNO;

--Create view for displaying employee details as follows
--deptno,empno,ename,sal,comm(if null -o),totalsalary(sal+comm[comm=null=>0])

CREATE VIEW vw_empsaldetails(DEPTNO, EMPNO, ENAME, SAL, COMM, TOTALSALARY)
AS
SELECT
    DEPTNO, EMPNO, ENAME, SAL, nvl(COMM,0), SAL+nvl(COMM,0)
FROM
    EMP
DROP  VIEW vw_empsaldetails;
SELECT * FROM vw_empsaldetails;
SELECT * FROM vw_empsaldetails WHERE DEPTNO=30;
SELECT * FROM vw_empsaldetails WHERE SAL>(SELECT MIN(SAL) FROM vw_empsaldetails);