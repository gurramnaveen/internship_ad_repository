--******************************************************************************
--SEQUENCE
--******************************************************************************

--CREATE SEQUENCE
CREATE SEQUENCE item_seq;

--USING SEQUENCE
SELECT item_seq.NEXTVAL
FROM DUAL;

SELECT item_seq.CURRVAL
FROM DUAL;

--USING SEQUENCE REPEATEDLY
SELECT item_seq.NEXTVAL
FROM DUAL
CONNECT BY level <= 5;

-- USING SEQUENCE IN TABLE
CREATE TABLE product (
    PID NUMBER,
    NAME VARCHAR2(30)
);

INSERT INTO product VALUES(item_seq.NEXTVAL, 'PEPSI');
INSERT INTO product VALUES(item_seq.NEXTVAL, 'COKE');

SELECT PID, NAME
FROM product;
