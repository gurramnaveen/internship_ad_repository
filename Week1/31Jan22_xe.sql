-- *****************************************************************************
-- 1. Create USER
-- *****************************************************************************
    
    CREATE USER c##navin IDENTIFIED BY 123;
    
    SELECT 
        username,
        default_tablespace,
        profile,
        authentication_type
    FROM
        dba_users
    WHERE
        account_status = 'OPEN'
    ORDER BY 
        username;
        
-- *****************************************************************************
-- 2. Grant Control
-- *****************************************************************************

    GRANT CREATE SESSION TO C##NAVIN;
    GRANT CREATE TABLE TO C##NAVIN;
    GRANT CREATE VIEW TO C##NAVIN;
    GRANT CREATE ANY TRIGGER TO C##NAVIN;
    GRANT CREATE ANY PROCEDURE TO C##NAVIN;
    GRANT CREATE SEQUENCE TO C##NAVIN;
    GRANT CREATE SYNONYM TO C##NAVIN;
    GRANT ALL PRIVILEGES TO C##NAVIN;
    GRANT CONNECT TO C##NAVIN;
    GRANT RESOURCE TO C##NAVIN;
    GRANT DBA TO C##NAVIN;
    
-- *****************************************************************************
-- 3. Connect to user C##ABC
-- *****************************************************************************

    CONNECT SYS/ROOT
    
-- *****************************************************************************
-- 4. Create table
-- *****************************************************************************

    CREATE TABLE BRANCH (
        BRANCHNO INT CONSTRAINT PK_BRANCH_BRANCHNO PRIMARY KEY,
        BRANCHNAME VARCHAR2(20),
        LOCATION VARCHAR2(20)
    );
    
    CREATE TABLE DEPT (
        DEPTNO NUMBER(2) CONSTRAINT PK_DEPT_DEPTNO PRIMARY KEY,
        DNAME VARCHAR2(14),
        BRANCHNO INT CONSTRAINT FK_DEPT_BRANCHNO REFERENCES BRANCH
    );
    
    CREATE TABLE EMP (
        EMPNO NUMBER(4) CONSTRAINT PK_EMP_EMPNO PRIMARY KEY,
        ENAME VARCHAR2(10),
        JOB VARCHAR2(9),
        MGR NUMBER(4),
        HIREDATE DATE,
        SAL NUMBER(7,2),
        COMM NUMBER(7,2),
        DEPTNO NUMBER(2) CONSTRAINT FK_EMP_DEPTNO REFERENCES DEPT,
        BRANCHNO INT CONSTRAINT FK_EMP_BRANCHNO REFERENCES BRANCH
    );
    
-- *****************************************************************************
-- 5. Insert data into Branch
-- *****************************************************************************

    INSERT INTO BRANCH VALUES 	(101,'Geneva','NEW YORK');
    INSERT INTO BRANCH VALUES 	(102,'Geneva','NEW YORK');
    INSERT INTO BRANCH VALUES 	(103,'CHICAGO','CHICAGO');
    INSERT INTO BRANCH VALUES 	(104,'CHICAGO','CHICAGO');
    INSERT INTO BRANCH VALUES 	(105,'Kingston','NEW YORK');
    INSERT INTO BRANCH VALUES 	(106,'Kingston','NEW YORK'); 

-- *****************************************************************************
-- 6. Insert data into Dept
-- *****************************************************************************
    
    INSERT INTO DEPT VALUES	(10,'ACCOUNTING',101);
    INSERT INTO DEPT VALUES (20,'RESEARCH',103);
    INSERT INTO DEPT VALUES	(30,'SALES',105);
    INSERT INTO DEPT VALUES	(40,'OPERATIONS',106);
    
-- *****************************************************************************
-- 6. Insert data into Emp
-- *****************************************************************************    

    INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20,102);
    INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30,102);
    INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30,103);
    INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20,104);
    INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30,105);
    INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30,105);
    INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10,102);
    INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20,103);
    INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,NULL,101);
    INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30,104);
    INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20,105);
    INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30,103);
    INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20,105);
    INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10,104);
    INSERT INTO EMP VALUES(7901,'JOHN_SMITH','CLERK',7698,to_date('23-1-1982','dd-mm-yyyy'),3000,NULL,30,104);

    COMMIT;
    
-- *****************************************************************************
-- 8. Display all redords of Dept.
-- *****************************************************************************

    SELECT * FROM DEPT;
    SELECT DEPTNO, DNAME FROM DEPT;
    
-- *****************************************************************************
-- 9. Display all redords of Branch.
-- *****************************************************************************

    SELECT * FROM BRANCH;
    SELECT BRANCHNO,  BRANCHNAME, LOCATION FROM BRANCH;
    
-- *****************************************************************************
-- 10. Display all redords of Emp.
-- *****************************************************************************

    SELECT * FROM EMP;
    SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM FROM EMP;
    
-- *****************************************************************************
-- 11. Sort records using order by clause.
-- *****************************************************************************
-- 11.1 Sort all the employees details on empno
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    ORDER BY
        EMPNO;
        
-- *****************************************************************************
-- 11.2 Sort all the employees details on deptno
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    ORDER BY
        DEPTNO;
    
-- *****************************************************************************
-- 11.3 Sort all the employees details as per department by emp no
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    ORDER BY
        DEPTNO, EMPNO;
        
-- *****************************************************************************
-- 11.4 Sort the all employees details as per department in ascending by emp no descending
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    ORDER BY
        DEPTNO, EMPNO DESC;
        
-- *****************************************************************************
-- 11.5 Sort the all employees details as per department no, salary
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    ORDER BY
        DEPTNO, SAL;
        
-- *****************************************************************************
-- 11.6 Sort the all employees details as per salary
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    ORDER BY
        SAL;
        
-- *****************************************************************************
-- 11.7 Sort the all employees details as per salary
-- *****************************************************************************
    
    SELECT
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, BRANCHNO
    FROM
        EMP
    ORDER BY
        SAL DESC;