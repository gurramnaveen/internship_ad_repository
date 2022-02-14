--******************************************************************************
--SYNONYM
--******************************************************************************

SELECT *
FROM sys.EMP;

--CREATE SYNONYM
CREATE PUBLIC SYNONYM EMP
FOR sys.EMP;

SELECT *
FROM EMP;

--DROP SYNONYM
DROP SYNONYM EMP;

--FOLLOWING QUERY WILL GIVE ERROR
SELECT *
FROM EMP;