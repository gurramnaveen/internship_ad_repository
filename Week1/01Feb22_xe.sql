-- *****************************************************************************
-- 12 WHERE CLAUSE
-- Where caluse with in,not in, is null, is not null, between, not between
-- Where caluse with Comparison Operator (<,>,<=,>=,=,<>,!=)
-- Where caluse with Logical Operator (AND,OR,NOT)
-- *****************************************************************************
-- 12.1 Display all the employees with deptno 10.
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        DEPTNO=10;

-- *****************************************************************************
-- 12.2 Display EMPNO, NAME, DEPTNO the employees with deptno 10.
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        DEPTNO=10;

-- *****************************************************************************
-- 12.3 Display all the employees working in deptno 10 or 20.
-- USING OR
-- USING IN
-- *****************************************************************************
    
-- USING OR

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        DEPTNO=10 OR DEPTNO=20;

-- USING IN

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        DEPTNO IN (10, 20);
        
-- *****************************************************************************
-- 12.3 Display all the employees not working in deptno 10 or 20.
-- USING OR
-- USING IN
-- *****************************************************************************
    
-- USING OR

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        DEPTNO!=10 AND DEPTNO!=20;

-- USING IN

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        DEPTNO NOt IN (10, 20);
        
-- *****************************************************************************
-- 12.4 Display all the employees not working in any dept
-- *****************************************************************************
    
-- USING NOT IN
    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        DEPTNO NOt IN (10, 20, 30);
    
-- USING NULL
    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        DEPTNO IS NULL
        
-- *****************************************************************************
-- 12.7 Display all the employees working in dept 30 and earning some commision
-- *****************************************************************************

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        DEPTNO=30 AND (COMM IS NULL OR COMM=0);
        
-- *****************************************************************************
-- 12.8 Display all the employees NOT earning any commision
-- *****************************************************************************

    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    WHERE
        COMM IS NULL OR COMM=0;
        
-- *****************************************************************************
-- 12.9 Display all the employees earning salary in range 1000 to 3000 including boundary
-- *****************************************************************************

    SELECT
        EMPNO, ENAME, SAL
    FROM
        EMP
    WHERE
        SAL >=1000 AND SAL <= 3000
    ORDER BY
        SAL;
        
-- USNIG BETWEEN
    SELECT
        EMPNO, ENAME, SAL
    FROM
        EMP
    WHERE
        SAL BETWEEN 1000 AND 3000
    ORDER BY
        SAL;
        
-- *****************************************************************************
-- 12.10 Display all the employees earning salary in range 1000 to 3000 exluding boundary
-- *****************************************************************************

    SELECT
        EMPNO, ENAME, SAL
    FROM
        EMP
    WHERE
        SAL >1000 AND SAL < 3000
    ORDER BY
        SAL;
        
-- *****************************************************************************
-- 12.11 Display all the employees earning salary not in range 1000 to 3000
-- *****************************************************************************

    SELECT
        EMPNO, ENAME, SAL
    FROM
        EMP
    WHERE
        SAL < 1000 OR SAL > 3000
    ORDER BY
        SAL;

-- *****************************************************************************
-- 12.12 Display all the employees earning salary exactly 5000
-- *****************************************************************************

    SELECT
        EMPNO, ENAME, SAL
    FROM
        EMP
    WHERE
        SAL = 5000
    ORDER BY
        SAL;
        
-- *****************************************************************************
-- 12.13  Display all the employees earning salary is not 5000
-- *****************************************************************************

    SELECT
        EMPNO, ENAME, SAL
    FROM
        EMP
    WHERE
        SAL!=5000
    ORDER BY
        SAL;
------------------------------------
    SELECT
        EMPNO, ENAME, SAL
    FROM
        EMP
    WHERE
        SAL<>5000
    ORDER BY
        SAL;
        
-- *****************************************************************************
-- 13 Where caluse with like
-- WHERE WITH ESCAPE Clause
-- *****************************************************************************
-- 13.1 Dissplay all the details of smith
-- *****************************************************************************
    SELECT
        EMPNO, ENAME
    FROM
        EMP
    WHERE
        ENAME = 'SMITH';
        
-- As oracle is case sensitive the following doesnt work

    SELECT
        EMPNO, ENAME
    FROM
        EMP
    WHERE
        ENAME = 'Smith';
        
-- *****************************************************************************
-- 13.2 Dissplay all the details of employee whose name start with S
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME
    FROM
        EMP
    WHERE
        ENAME LIKE 'S%'
    ORDER BY
        ENAME;
        
-- *****************************************************************************
-- 13.3 Dissplay all the details of employee whose name ends with S
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME
    FROM
        EMP
    WHERE
        ENAME LIKE '%S'
    ORDER BY
        ENAME;
        
-- *****************************************************************************
-- 13.4 Dissplay all the details of employee whose name contains LL
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME
    FROM
        EMP
    WHERE
        ENAME LIKE '%LL%'
    ORDER BY
        ENAME;
-- *****************************************************************************
-- 13.5 Dissplay all the details of employee whose name contains _
-- *****************************************************************************
    
-- BELOW BOTH  QUERY WONT WORK
    SELECT
        EMPNO, ENAME
    FROM
        EMP
    WHERE
        ENAME LIKE '%_%' ESCAPE '\'
    ORDER BY
        ENAME;
--------------------------------------
    SELECT
        EMPNO, ENAME
    FROM
        EMP
    WHERE
        ENAME LIKE '%\_%'
    ORDER BY
        ENAME;
    
-- USING ESCAPE
    SELECT
        EMPNO, ENAME
    FROM
        EMP
    WHERE
        ENAME LIKE '%\_%' ESCAPE '\'
    ORDER BY
        ENAME;
-------------------------------------
    SELECT
        EMPNO, ENAME
    FROM
        EMP
    WHERE
        ENAME LIKE '%@_%' ESCAPE '@'
    ORDER BY
        ENAME;
        
-- *****************************************************************************
-- 14. Aggregate Function max,min,sum,avg,count 
--     SUM
--     AVG
--     COUNT
--     MAX
--     MIN
-- *****************************************************************************
-- 14.1 Display count of Employees
-- count(*) including null values
-- *****************************************************************************

    SELECT
        COUNT(*)
    FROM
        EMP;
    
-- *****************************************************************************
-- 14.2 Display count of emopoyees working on same dept.
-- *****************************************************************************

    SELECT 
        COUNT(DEPTNO)
    FROM
        EMP;
        
-- *****************************************************************************
-- 14.3 Display MAX, MIN, SUM, AVERAGE, COUNT OF SALARY
-- *****************************************************************************

    SELECT
        MIN(SAL), MAX(SAL), SUM(SAL), AVG(SAL), COUNT(SAL)
    FROM
        EMP;
        
-- *****************************************************************************
-- 15 Aggregate Function max,min,sum,avg,count  and grouping
-- *****************************************************************************
-- 15.1 Display department wise count of employees
-- *****************************************************************************

    SELECT
        DEPTNO, COUNT(EMPNO)
    FROM
        EMP
    GROUP BY
        DEPTNO
    ORDER BY
        DEPTNO;

-- *****************************************************************************
-- 15.1 Display job wise count of employees
-- *****************************************************************************

    SELECT
        JOB, COUNT(EMPNO)
    FROM
        EMP
    GROUP BY
        JOB
    ORDER BY
        JOB;
        
-- *****************************************************************************
-- 15.2 Display dept wise max, min, avg sal
-- *****************************************************************************

    SELECT
        DEPTNO, MAX(SAL), MIN(SAL), ROUND(AVG(SAL))
    FROM
        EMP
    GROUP BY
        DEPTNO
    ORDER BY
        DEPTNO;
        
-- *****************************************************************************
-- 15.3 Display dept wise max, min, avg sal where avg(sal)<2500
-- *****************************************************************************

    SELECT
        DEPTNO, MAX(SAL), MIN(SAL), ROUND(AVG(SAL))
    FROM
        EMP
    GROUP BY
        DEPTNO
    HAVING
        AVG(SAL) < 2500
    ORDER BY
        DEPTNO;
        
-- *****************************************************************************
-- 16. Special functions nvl() 
-- If comm is null display 0
-- Display empno,ename,sal,comm and total sal=sal+comm for all employees
-- 0+1=1
-- NULL+1=NULL
-- IN ORACLE WE CAN TEMPORARILY FOR CALCULATION PURPOSE REPLACE NULL VALUE WITH ANY VALUE
-- NVL=>NULLVALUE REPLACEMENT
-- *****************************************************************************

    SELECT
        EMPNO,ENAME, SAL, COMM, SAL+NVL(COMM,0)
    FROM
        EMP
    ORDER BY
        COMM;
--------------------------------------------------------------------------------



    SELECT
        EMPNO, ENAME, SAL, COMM,
        CASE
            WHEN COMM IS NULL OR COMM=0
                THEN 100
            WHEN COMM > 0
                THEN COMM
        END AS UPDATE_COMM,
        SAL+CASE
            WHEN COMM IS NULL OR COMM=0
                THEN 100
            WHEN COMM > 0
                THEN COMM
        END AS 
    FROM
        EMP
    ORDER BY
        COMM;
        
-- *****************************************************************************
-- 17.Distinct value
-- *****************************************************************************

    SELECT
        DISTINCT DEPTNO
    FROM
        EMP;
        
-- *****************************************************************************
-- 18. SUB QUERY
-- QUERY WITHIN THE QUERY
-- INNER QUERY
-- OUTER QUERY
-- outer Query depends on result of INNER query
-- *****************************************************************************
-- 18.1 Display the employees details such as empno, ename, sal who is earning more then avg sal
-- *****************************************************************************

--DISPLAY EMPNO, ENAME, SAL
    SELECT
        EMPNO, ENAME, SAL
    FROM
        EMP;
        
--AVG(SAL)
    SELECT
        AVG(SAL)
    FROM
        EMP;
    
--sal>avg(sal) final solution

    SELECT 
        EMPNO, ENAME, SAL
    FROM 
        EMP
    WHERE
        SAL>(
        SELECT 
            AVG(SAL)
        FROM 
            emp
    );
    
-- *****************************************************************************
-- 18.2 Display empno,ename,deptno for all employees working in 'ACCOUNTING'
-- *****************************************************************************

-- Display empno,ename,deptno for all employees
    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP;
        
-- employees working in 'ACCOUNTING'
    SELECT
        DEPTNO
    FROM
        DEPT
    WHERE
        DNAME = 'ACCOUNTING';
        
-- FINAL
    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        DEPTNO = (
        SELECT
            DEPTNO
        FROM
            DEPT
        WHERE
            DNAME = 'ACCOUNTING'
    );        

-- *****************************************************************************
-- 18.3 Display empno,ename,deptno for all employees from department having employee earning salary > avg(salary)
-- *****************************************************************************

-- department having employee earning salary > avg(salary)
    SELECT 
        DEPTNO
    FROM
        EMP
    WHERE
        SAL > (
        SELECT
            AVG(SAL)
        FROM
            EMP
    )
    ORDER BY
        DEPTNO;
        
-- Display empno,ename,deptno for all employees
    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP;
        
-- FINAL
    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        DEPTNO IN (
        SELECT
            DEPTNO
        FROM
            EMP
        WHERE
            SAL > (
            SELECT
                AVG(SAL)
            FROM
                EMP
            )
        )
    AND
        SAL > (
        SELECT
            AVG(SAL)
        FROM
            EMP
        )
    ORDER BY
        DEPTNO;

-- *****************************************************************************
-- 18.4 Display empno,ename,deptno for employees earning greater than any from employees of dept 30
-- *****************************************************************************

-- Display empno,ename,deptno for employees
    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP
    WHERE
        DEPTNO <> 30;
        
-- employees earning greater than any from employees of dept 30
    SELECT
        SAL
    FROM
        EMP
    WHERE
        DEPTNO = 30
    ORDER BY
        SAL;
        
--FINAL
    SELECT
        EMPNO, ENAME, DEPTNO, SAL
    FROM
        EMP
    WHERE
        SAL > ANY (
        SELECT
            SAL
        FROM
            EMP
        WHERE
            DEPTNO=30
        )
    AND
        DEPTNO <> 30
    ORDER BY SAL;