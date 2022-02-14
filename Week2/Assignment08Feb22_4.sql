--==============================================================================
--******************************************************************************
--BITMAP INDEX
--******************************************************************************
--==============================================================================

SELECT *
FROM members
WHERE gender = 'F';

--COLOUMN GENDER HAVING LOW CARDINALITY
SELECT gender, COUNT(*)
FROM members
GROUP BY gender;

--BITMAP WILL PERFROM WELL ON THE COLOMNS HAVING LOW CARDINALITY
--CREATING BITMAP INDEX FOR GENDER

EXPLAN PLAN FOR
SELECT *
FROM members
WHERE gender = 'F';

CREATE BITMAP INDEX bi_members_gender
ON members(gender);

EXPLAN PLAN FOR
SELECT *
FROM members
WHERE gender = 'F';

SELECT
    PLAN_TABLE_OUTPUT
FROM
    TABLE(DBMS_XPLAN.DISPLAY());