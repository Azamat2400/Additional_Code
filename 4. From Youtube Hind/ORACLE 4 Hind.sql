CREATE TABLE EMP(
    emp_id NUMBER PRIMARY KEY, 
    emp_name VARCHAR(20), 
    emp_salary DECIMAL(10,2)
);

DESC emp;

INSERT ALL
INTO emp(emp_id, emp_name, emp_salary) VALUES (1, 'Ahmad', 40000)
INTO emp(emp_id, emp_name, emp_salary) VALUES (2, 'Mark', 35000)
INTO emp(emp_id, emp_name, emp_salary) VALUES (3, 'Abid', 50000)
INTO emp(emp_id, emp_name, emp_salary) VALUES (4, 'Rahul', 45000)
SELECT*FROM dual;

TRUNCATE TABLE EMP;

SELECT*FROM emp;

DROP TABLE EMP;

SELECT*FROM emp;

CREATE TABLE department_(
dept_id INT PRIMARY KEY,
dept_name VARCHAR2(50)
);

desc department_;
SELECT*FROM department_;

ALTER TABLE emp
ADD dept_id INT;

INSERT ALL
INTO department_ VALUES (1, 'IT')
INTO department_ VALUES (2, 'HR')
INTO department_ VALUES (3, 'MEDICAL')
INTO department_ VALUES (4, 'QUALITY')
SELECT*FROM dual;

UPDATE emp
SET emp.dept_id = 1
WHERE emp_id IN(1,4);

UPDATE emp
SET emp.dept_id = 2
WHERE emp_id IN(2,3);

SELECT*FROM emp
WHERE emp_id NOT IN (1,3);

INSERT ALL
INTO emp VALUES (5, 'Uzma', 30000, 3)
INTO emp VALUES (6, 'Sean', 40000, 5)
SELECT*FROM dual;

SELECT dept_id FROM emp
UNION ALL
SELECT dept_id FROM department_
ORDER BY dept_id;

SELECT * FROM emp
CROSS JOIN department_;

SELECT tablespace_name
FROM user_tablespaces;

SELECT 
tablespace_name,
file_name, 
bytes
FROM dba_data_files;

CREATE TABLESPACE test DATAFILE'C:\app\NISHONOV\product\21c\oradata\XE\test1.dbf'
size 50m;

ALTER TABLESPACE test DROP DATAFILE'C:\app\NISHONOV\product\21c\oradata\XE\test1.dbf';

DROP TABLESPACE test INCLUDING CONTENTS and datafiles;


SELECT*FROM emp;

SELECT STDDEV(emp_id)
FROM emp;

SELECT VARIANCE(emp_id)
FROM emp;

SELECT*FROM emp
WHERE UPPER(emp_name) = 'AHMAD';

SELECT LOWER(emp_name)
FROM emp;

SELECT INITCAP('AhMad aLi')
FROM dual;

SELECT CONCAT(emp_name, emp_salary) 
FROM emp;

SELECT SUBSTR('I am Ahmad', 6, 3)
FROM dual;

SELECT LENGTH('I am Ahmad')
FROM dual;

SELECT INSTR('I am Ahmad', 'Ahmad')
FROM dual;

SELECT LPAD('Ahmad', 3)
FROM dual;

SELECT TRIM('  Ahmad  ')
FROM dual;

SELECT REPLACE('Paxta va Taxta', 'axta')
FROM dual;

SELECT* FROM emp;

DELETE FROM emp
WHERE emp_id > 3;

DELETE FROM emp;

ROLLBACK;

--INDEX
CREATE INDEX index_empname 
ON emp(emp_name);

desc emp;

SELECT index_name
FROM all_indexes
WHERE table_name = 'EMP';

SELECT index_name, column_name
FROM all_ind_columns
WHERE table_name = 'EMP';

--VIEW
CREATE VIEW v_order_info AS
SELECT 
co.order_id "ID", 
c.first_name "Customer Name",
p.product_name "Product Name", 
p.price "Product Price"
FROM customer_order co, customer c, product p
WHERE co.customer_id = c.customer_id AND 
co.product_id = p.product_id;

SELECT*FROM v_order_info;

--TRUNC
SELECT TRUNC(29.16,1), TRUNC(38.2,-1)
FROM dual;

--NVL
SELECT 
first_name,
salary,
NVL(salary, 24000)
FROM employee;

--DECODE
SELECT
first_name,
address_state,
DECODE(address_state, 'CA', 'CANADA', 'CALIF', 'CALIFORNIYA')
FROM customer;

CREATE TABLE students(std_id number PRIMARY KEY, first_name VARCHAR2(20));

--SEQUENCE
CREATE SEQUENCE std_seq
INCREMENT BY 1 
START WITH 100 
MAXVALUE 999 
MINVALUE 1 
NOCYCLE 
NOCACHE 
NOORDER; 

INSERT INTO students VALUES(std_seq.nextval, 'Ahmad');

SELECT std_seq.currval 
FROM students;

SELECT*FROM students;

INSERT INTO students VALUES(std_seq.nextval, 'Mark');

INSERT INTO students VALUES(std_seq.nextval, 'Uzma');

SELECT 
SYSDATE, 
SYSTIMESTAMP,
UID,
USER,
ROWID,
ROWNUM
FROM dual;

SELECT
ROWID,
first_name
FROM students;

SELECT
ROWID,
ROWNUM,
first_name
FROM students;

SELECT 
ROWNUM,
first_name
FROM students
WHERE ROWNUM < 3;

SELECT*FROM tab;

SELECT*FROM ALL_TABLES;

SELECT*FROM employee;

START C:\Users\NISHONOV\Documents\employee.sql;

--View
CREATE VIEW employee_view AS
SELECT first_name, salary
FROM employee;

SELECT*FROM employee_view;

CREATE OR REPLACE VIEW employee_view AS
SELECT * FROM employee;

INSERT INTO employee_view(employee_id, first_name) VALUES(500, 'Nadeem');

SELECT * FROM employee;

DROP VIEW employee_view;

--Input variable
SELECT*FROM emp;

ACCEPT ename CHAR PROMPT 'Please Enter Employee Name:'
SELECT*FROM emp
WHERE emp_name = '&ename';

ACCEPT eid NUMBER PROMPT 'Please Enter Employee Id:'
SELECT*FROM emp
WHERE emp_id = &eid;

DEFINE eid = 3;
SELECT*FROM emp
WHERE emp_id = &eid;

--PL/SQL
DECLARE
    message VARCHAR2(50);
BEGIN
    message:='Welcome to IT Expert';
    dbms_output.put_line(message);
END;

SET SERVEROUTPUT ON;


DECLARE
    name emp.emp_name%type;
    salary emp.emp_salary%type;
    msg number;
BEGIN
    SELECT emp_name, emp_salary 
    INTO name, salary
    FROM emp
    WHERE emp_id = &msg;
    dbms_output.put_line(name);
    dbms_output.put_line(salary);
END;

set SERVEROUTPUT on;

DECLARE
    e_sales number :=5000;
    e_comission number :=0;
BEGIN
    IF e_sales > 4000 THEN e_comission :=(e_sales*10)/100;
    dbms_output.put_line('Your comission is 10% equal to:'||e_comission);
    END IF;
END;

set SERVEROUTPUT on;

--TRIGGER
SELECT*FROM emp;

CREATE TABLE new_emp (
  ID NUMBER(5),
  salary NUMBER(8),
  massage VARCHAR2(50)
);

SELECT*FROM new_emp;

CREATE TRIGGER trigger_emp
AFTER UPDATE OF emp_salary
ON emp
FOR EACH ROW
BEGIN
INSERT INTO new_emp(id, salary, massage)
VALUES (:old.emp_id, :new.emp_salary, 'Record is updated');
END;

--PROCEDURE
CREATE OR REPLACE PROCEDURE welcome
AS
BEGIN
    dbms_output.put_line('Welcome IT Expert');
END;

BEGIN
welcome;
END;

set SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE insert_dept (
dept_id IN NUMBER, dept_name IN VARCHAR)
IS
BEGIN
INSERT INTO department_ VALUES (dept_id, dept_name);
END;

BEGIN
    insert_dept(6, 'RECEPTION');
END;
