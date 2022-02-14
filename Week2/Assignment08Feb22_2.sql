--==============================================================================
--******************************************************************************
--UNIQUE INDEX
--******************************************************************************
--==============================================================================

--CREATE UNIQUE INDEX
CREATE UNIQUE INDEX i_members_email
ON members(email);

---------------------------------------------------------
SELECT * FROM members
WHERE email = 'pelce0@trellian.com';
--FOLLOWING QUERY HAS DUPLICATE EMAIL SO IT WILL GIVE ERROR
INSERT INTO members(first_name, last_name, gender, dob, email)
VALUES('Pegpa','Elce','F',DATE '1990-01-02','pelce0@trellian.com');

--CREATING INDEX ON MULTIPLE COLOUMNS
CREATE TABLE unq_idx_demo(
    a INT,
    b INT
);

CREATE UNIQUE INDEX i_unq_idx_demo_ab
ON unq_idx_demo(a,b);

INSERT INTO unq_idx_demo
VALUES(1,1);
INSERT INTO unq_idx_demo
VALUES(1,2);
INSERT INTO unq_idx_demo
VALUES(1,1);