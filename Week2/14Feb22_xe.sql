CREATE OR REPLACE FUNCTION get_emp_by_deptno(p_deptno emp.deptno%type)
RETURN SYS_REFCURSOR
AS
   EMP_REF_CURSOR SYS_REFCURSOR;
BEGIN
    OPEN EMP_REF_CURSOR FOR
    SELECT *
    FROM EMP
    WHERE DEPTNO = p_deptno;
    
    RETURN EMP_REF_CURSOR;
END;

CREATE OR REPLACE PROCEDURE prc_get_ename_byempno(p_empno emp.empno%type)
As
    v_ename emp.ename%type;
begin
     select ename into v_ename from emp where empno=p_empno;
     DBMS_OUTPUT.PUT_LINE('ename of empno '||p_empno ||' is '||v_ename);   
end;       
        
execute prc_get_ename_byempno(7499);

SELECT * FROM EMP;