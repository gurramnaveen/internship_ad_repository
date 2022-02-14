--******************************************************************************
-- 1. Display all the information of the EMP table?
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP;

--******************************************************************************
-- 2. Display unique Jobs from EMP table?
--******************************************************************************

    SELECT
        DISTINCT JOB
    FROM
        EMP;
        
--******************************************************************************
-- 3.  List the emps in the asc order of their Salaries?
--******************************************************************************
    
    SELECT
        EMPNO, ENAME, SAL
    FROM
        EMP
    ORDER BY
        SAL;
        
--******************************************************************************
-- 4. List the details of the emps in asc order of the Dptnos and desc of Jobs?
--******************************************************************************
    
    SELECT
        DEPTNO, JOB, EMPNO, ENAME, MGR, HIREDATE, SAL, COMM, BRANCHNO
    FROM
        EMP
    ORDER BY
        DEPTNO, JOB DESC;
        
--******************************************************************************
-- 5.Display all the unique job groups in the descending order?
--******************************************************************************

    SELECT
        DISTINCT JOB
    FROM
        EMP
    ORDER BY
        JOB DESC;

--******************************************************************************
-- 6. Display all the details of all 'Mgrs'
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        EMPNO IN (
        SELECT
            MGR
        FROM
            EMP
        );

--******************************************************************************
-- 7. List the emps who joined before 1981
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        HIREDATE < '01-JAN-1981';

--******************************************************************************
-- 8.  List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
--******************************************************************************

    SELECT
        EMPNO, ENAME, SAL, ROUND(SAL/30, 2) AS DAILY_SAL
    FROM
        EMP
    ORDER BY
        SAL*12;

--******************************************************************************
-- 9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB, HIREDATE, TRUNC(MONTHS_BETWEEN(CURRENT_DATE, HIREDATE)/12) AS EXP
    FROM
        EMP
    WHERE
        EMPNO IN (
        SELECT
            MGR
        FROM
            EMP
        );   

--******************************************************************************
-- 10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369
--******************************************************************************

    SELECT
        EMPNO, ENAME, SAL, TRUNC(MONTHS_BETWEEN(CURRENT_DATE, HIREDATE)/12) AS EXP
    FROM
        EMP
    WHERE
        MGR=7369;

--******************************************************************************
-- 11. Display all the details of the emps whose Comm  Is more than their Sal
--******************************************************************************
    
    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        COMM > SAL;

--******************************************************************************
-- 12. NOT GIVEN
--******************************************************************************
--******************************************************************************
-- 13. List the emps along with their Exp and Daily Sal is more than Rs 100
--******************************************************************************

    SELECT
        EMPNO, ENAME, TRUNC(MONTHS_BETWEEN(CURRENT_DATE, HIREDATE)/12) AS EXP, ROUND(SAL/30, 2) AS DAILY_SAL
    FROM
        EMP
    WHERE
        SAL/30 > 100;

--******************************************************************************
-- 14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB
    FROM
        EMP
    WHERE
        JOB='CLERK' OR JOB='ANALYST'
    ORDER BY
        JOB DESC;

--******************************************************************************
-- 15.  List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        HIREDATE = '01-MAY-81' OR HIREDATE = '03-DEC-81' OR HIREDATE = '17-DEC-81' OR HIREDATE = '19-JAN-80'
    ORDER BY
        HIREDATE;

--******************************************************************************
-- 16.  List the emp who are working for the Deptno 10 or20
--******************************************************************************

    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        DEPTNO IN (10, 20)
    ORDER BY
        DEPTNO;

--******************************************************************************
-- 17. List the emps who are joined in the year 81
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        HIREDATE >= '01-JAN-81' AND HIREDATE <= '31-DEC-81'
    ORDER BY
        HIREDATE;
        
--******************************************************************************
-- 18. NOT GIVEN
--******************************************************************************
--******************************************************************************
-- 19. List the emps Who Annual sal ranging from 22000 and 45000
--******************************************************************************

    SELECT
        EMPNO, ENAME, SAL*12 AS ANNSAL
    FROM
        EMP
    WHERE
        SAL*12 BETWEEN 22000 AND 45000
    ORDER BY
        ANNSAL;

--******************************************************************************
-- 20. List the Enames those are having five characters in their Names
--******************************************************************************

    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        ENAME LIKE '_____';

--******************************************************************************
-- 21. List the Enames those are starting with ‘S’ and with five characters
--******************************************************************************

    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        ENAME LIKE 'S____';

--******************************************************************************
-- 22.  List the emps those are having four chars and third character must be ‘r’
--******************************************************************************

    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        ENAME LIKE '__R_';

--******************************************************************************
-- 23.  List the Five character names starting with ‘S’ and ending with ‘H’
--******************************************************************************

    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        ENAME LIKE 'S___H';

--******************************************************************************
-- 24. List the emps who joined in January
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        EXTRACT(MONTH FROM  HIREDATE) = 1
    ORDER BY
        HIREDATE;

--******************************************************************************
-- 25. NOT GIVEN
--******************************************************************************
--******************************************************************************
-- 26. NOT GIVEN
--******************************************************************************
--******************************************************************************
-- 27.  List the emps whose names having a character set ‘ll’ together
--******************************************************************************

    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        ENAME LIKE '%LL%';

--******************************************************************************
-- 28. NOT GIVEN
--******************************************************************************
--******************************************************************************
-- 29.  List the emps who does not belong to Deptno 20
--******************************************************************************

    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        DEPTNO <> 20
    ORDER BY
        DEPTNO;

--******************************************************************************
-- 30.  List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB, SAL, MGR
    FROM
        EMP
    WHERE
        JOB <> 'PRESIDENT' AND EMPNO NOT IN (
        SELECT
            CASE
                WHEN MGR IS NULL
                    THEN 0
                WHEN MGR > 0
                    THEN MGR
            END
        FROM
            EMP
        )
    ORDER BY
        SAL;

--******************************************************************************
-- 31.  List the emps whose Empno not starting with digit78
--******************************************************************************

    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        TRUNC(EMPNO/100)=78;
    
--******************************************************************************
-- 32. NOT GIVEN
--******************************************************************************
--******************************************************************************
-- 33. List the emps who are working under ‘MGR’
--******************************************************************************

    SELECT
        EMPNO, ENAME, MGR, JOB, DEPTNO
    FROM
        EMP
    WHERE MGR IS NOT NULL;
    
--******************************************************************************
-- 34.  List the emps who joined in any year but not belongs to the month of March
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        EXTRACT(MONTH FROM  HIREDATE) <> 3
    ORDER BY
        HIREDATE;

--******************************************************************************
-- 35. List all the Clerks of Deptno 20
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB, DEPTNO
    FROM
        EMP
    WHERE
        DEPTNO = 20 AND JOB LIKE 'CLERK';

--******************************************************************************
-- 36. List the emps of Deptno 30 or 10 joined in the year 1981
--******************************************************************************

    SELECT
        EMPNO, ENAME, DEPTNO, HIREDATE
    FROM
        EMP
    WHERE
        DEPTNO IN (30, 10) AND HIREDATE >='01-JAN-1981' AND HIREDATE <='31-DEC-1981'
    ORDER BY
        DEPTNO, HIREDATE;

--******************************************************************************
-- 37. Display the details of SMITH
--******************************************************************************

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        ENAME LIKE 'SMITH';

--******************************************************************************
-- 38. Display the location of SMITH
--******************************************************************************
    
    SELECT
        LOCATION AS SMITH_LOCATION
    FROM
        BRANCH
    WHERE
        BRANCHNO = (
            SELECT
                BRANCHNO
            FROM
                EMP
            WHERE
                ENAME LIKE 'SMITH'
        );
