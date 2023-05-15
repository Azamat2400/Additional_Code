SELECT
    *
FROM
    employee;

--COALESCE
SELECT
    manager_id,
    coalesce(manager_id, 5)
FROM
    employee;

--NULLIF
SELECT
    nullif(0, 0),
    nullif(5, 6)
FROM
    dual;

SELECT
    nullif(10 / nullif(0, 0),
           0)
FROM
    dual;

SELECT
    10 / nullif(0, 0)
FROM
    dual;

--DATE
SELECT
    sysdate,
    EXTRACT(YEAR FROM sysdate)  AS year,
    EXTRACT(MONTH FROM sysdate) AS month,
    EXTRACT(DAY FROM sysdate)   AS day
FROM
    dual;

--CHECK
CREATE TABLE inson (
    name   VARCHAR2(20),
    gender VARCHAR2(6),
    CONSTRAINT gender_constraint CHECK ( gender = 'male'
                                         OR gender = 'female' )
);

insert into inson values('mayk', 'male');
insert into inson values('mira', 'female');

--UPDATE
UPDATE INSON
SET name = 'izma', gender = 'female'
WHERE name = 'mayk';

SELECT*FROM employee e
JOIN department d
ON e.department_id = d.department_id;