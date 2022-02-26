SET SERVEROUTPUT ON;
--******************************************************************************
--PRINTING HELLO WORLD
BEGIN
    DBMS_OUTPUT.put_line('HELLO WORLD!');
END;

--******************************************************************************
-- USING VARIABLE
DECLARE
    l_message VARCHAR2(255) := 'HELLO WORLD!';
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_message);
END;

--******************************************************************************
-- ERROR/EXCEPTION HANDLING
DECLARE
    v_result NUMBER;
BEGIN
    v_result := 1/0;
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
--******************************************************************************
-- LOCAL VARIABLE
DECLARE
    l_ename varchar2(50):='KING';
    l_mgr  number:=0;
BEGIN
    DBMS_OUTPUT.put_line(l_ename);
    DBMS_OUTPUT.put_line(l_mgr);
END;

-----------------------------------------
-- GET ENAME FOR EMPNO 7788
DECLARE
    v_ename  varchar2(50);
BEGIN
        SELECT ename into v_ename from emp where empno=7788;
        
        DBMS_OUTPUT.PUT_LINE(v_ename);
END;
--******************************************************************************
--ANCHORED
DECLARE
    v_ename emp.ename%Type;
    v_sal   emp.sal%Type;
BEGIN
    SELECT
        ename,sal 
        INTO
        v_ename,v_sal
    FROM 
        emp
    WHERE 
        empno=7788;
    DBMS_OUTPUT.PUT_LINE(v_ename|| ':' || v_sal);
       
END;
--******************************************************************************
--CONSTANT
DECLARE 
    v_ename emp.ename%type;
    v_sal emp.sal%type;
    v_comm emp.comm%type;
    v_incentive constant emp.comm%type:=0.10;
BEGIN
        SELECT ENAME,SAL,nvl(comm,0) INTO v_ename,v_sal,v_comm 
        from emp where empno=7788;
--        v_incentive:=0.2; (expression 'V_INCENTIVE' cannot be used as an assignment target)
        v_sal:=v_sal+v_comm+v_incentive;
        
        DBMS_OUTPUT.PUT_line('Total Salary is '||v_sal);
END;
--******************************************************************************
--Section 2. Conditional control
-- conditional will work on expressions which returns true or false
-- if expression returns true there are set of instructions
-- if expression returns false there are another set of instructions
--IF statements – introduce you various IF statement to either execute or skip a sequence of statements based on a condition.
--CASE statements – learn how to choose one sequence of statements out of many possible sequences to execute.
--GOTO – explain the GOTO statement and shows how to use it to transfer control to a labeled block or statement.
--NULL statement – show you how to use the NULL statement to make the code more clear.
--******************************************************************************
-- MAX(SAL) < 6000 THEN PRINT SALARY REVISION IS NEEDED
DECLARE 
    v_maxsal emp.sal%type;
BEGIN
    select max(sal) into v_maxsal from emp;
    IF v_maxsal<6000 THEN 
        DBMS_OUTPUT.PUT_LINE('SALARY REVISION IS REQUIRED');
    END IF;
END;

-----------------------------------------------------------------------------
DECLARE 
    v_maxsal emp.sal%type;
BEGIN
    select max(sal) into v_maxsal from emp;
    IF v_maxsal<=4000 THEN 
        DBMS_OUTPUT.PUT_LINE('SALARY REVISION IS REQUIRED');
    ELSE  
        DBMS_OUTPUT.PUT_LINE('CAN CONSIDER IN NEXT YEAR');
    END IF;
END;

----------------------------------------------------------------------
DECLARE 
    v_maxsal emp.sal%type;
BEGIN
    select max(sal) into v_maxsal from emp;
    IF v_maxsal<3000 THEN 
        DBMS_OUTPUT.PUT_LINE('MAX SALARY <3000');
    ELSIF   v_maxsal<4000 THEN 
        DBMS_OUTPUT.PUT_LINE('MAX SALARY <4000');
    ELSE
        DBMS_OUTPUT.PUT_LINE('MAX SALARY <=5000');
    END IF;
END;
--******************************************************************************
--VARIABLE =(SET VALUES ) BASED ON VALUES OF THIS VARIABLE WE WANT TO MAKE DESCIONS 
--CASE STATEMENT IS USEFULL IN EQUALITY CHECK
--        CASE selector
--        WHEN selector_value_1 THEN
--            statements_1
--        WHEN selector_value_1 THEN 
--            statement_2
--        ...
--        ELSE
--            else_statements
--        END CASE;
-------------------------------------------------------------
DECLARE
        v_color color.colorcode%type;
BEGIN
    select colorcode into v_color from color where id=1;
    case v_color
        when '#FF0000' then dbms_output.put_line('RED');
        when '#00FF00' then dbms_output.put_line('GREEN');
        when '#0000FF' then dbms_output.put_line('BLUE')  ;  
        else  dbms_output.put_line('NO COLOR');
    end case;    
END;

--******************************************************************************
--PRINT FIRST 5 RECORDS[ENAME] FROM EMP
DECLARE
    v_i NUMBER := 1;
    v_ename emp.ename%type;
BEGIN
    LOOP
        select ename INTO v_ename FROM emp WHERE empno = 7368 + v_i ORDER BY empno;
        dbms_output.put_line(v_ename);
       -- v_i := v_i+1;
        
       /* IF v_i = 5 THEN
            EXIT;
        END IF;*/
        
    END LOOP;
END;
