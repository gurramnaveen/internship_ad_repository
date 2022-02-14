--==============================================================================
--******************************************************************************
--FUNCTION INDEX
--******************************************************************************
--==============================================================================

--CREATE INDEX ON LASTNAME
CREATE INDEX i_member_last_name
ON members(last_name);

--QUERY OPTIMIZER WILL USE INDEX FOR SEARCH
SELECT * FROM members
WHERE last_name='Sans';

--IF FUNCTION IS USED ON THE INDEX COLOUMN 
--THEN THE QUERY OPTIMIZER WONT LEVERAGE
EXPLAIN PLAN FOR
SELECT * FROM members
WHERE UPPER(last_name) = 'SANS';

SELECT
    PLAN_TABLE_OUTPUT
FROM
    TABLE(DBMS_XPLAN.DISPLAY());
    
--------------------------------------------------
--FUNCTION BASED INDEX CAN  BE CREATED AS SHOWN FOLLOW
CREATE INDEX fi_members_last_name
ON members(UPPER(last_name));

EXPLAIN PLAN FOR
SELECT * FROM members
WHERE UPPER(last_name) = 'SANS';

SELECT
    PLAN_TABLE_OUTPUT
FROM
    TABLE(DBMS_XPLAN.DISPLAY());