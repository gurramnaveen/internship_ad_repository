--CREATE ROLE MDM
CREATE ROLE C##MDM;

--GRANT PERMISSIONS TO MDM TROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON EMP TO C##MDM;