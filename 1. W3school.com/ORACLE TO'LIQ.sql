SELECT
    *
FROM
    customer;

SELECT
    *
FROM
    employee
WHERE
    first_name NOT BETWEEN 'Ann' AND 'Johnny';
    
SELECT * FROM employee
WHERE first_name BETWEEN 'Ann' AND 'Johnny';
    

INSERT INTO tajriba
values ('Azamat', 23, 'Toshkent');

INSERT INTO tajriba values ('Oybek', 24, 'Jizzax'),
                            ('Ibrohim', 23, 'Fargona');



SELECT * FROM Customer
FETCH FIRST 50 PERCENT ROWS ONLY;

SELECT * FROM Customer
WHERE ROWNUM <= 3;

SELECT * FROM employee
WHERE Hire_Date BETWEEN '01.07.12' AND '31.07.18';

--AS 
SELECT d.department_name  
FROM department d, employee e 
WHERE d.department_id = e.department_id and e.employee_id = 152;
  
SELECT A.first_name Name1, B.first_name Name2, A.address_state City
FROM Customer A, Customer B
WHERE A.Customer_ID <> B.Customer_ID AND A.address_state = B.address_state
ORDER BY City;

--concat
select*from customer;
SELECT CONCAT(CONCAT(first_name, ', '), last_name) as FIO
FROM Customer;

SELECT (first_name || ', ' || Last_name ) AS FIO
FROM Customer;

SELECT CONCAT(CONCAT(last_name, '''s department category is '), department_id) "Department"
  FROM employee 
  WHERE employee_id = 152;

SELECT CONCAT(CONCAT(last_name, '''s department category is '), (SELECT d.department_name  
                                                                    FROM department d, employee e 
                                                                    WHERE d.department_id = e.department_id 
                                                                    AND e.employee_id = 152)) "Department" 
  FROM employee 
  WHERE employee_id = 152;

--GROUP BY + JOIN
SELECT
    address_state,
    COUNT(customer_id) soni,
    COUNT(customer_id) * 100 / (  SELECT COUNT(customer_id)
                                   FROM customer)  foizi
FROM customer
GROUP BY address_state;

SELECT
    c.customer_id,
    c.last_name,
    COUNT(co.order_id) AS numberoforders
FROM
         customer_order co
    INNER JOIN customer c ON co.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.last_name
HAVING
    COUNT(co.order_id) > 10;
    
    
SELECT department_name
FROM department d
WHERE EXISTS (
        SELECT product_name
        FROM product p
        WHERE p.department_id = d.department_id AND price < 100
    );
    
SELECT
    p.product_name,
    p.price,
    d.department_name
FROM
         product p
    INNER JOIN department d ON p.department_id = d.department_id
                               AND price < 100;

SELECT
    p.product_id,
    p.product_name,
    p.price,
    p.department_id,
    d.department_name
FROM
    product    p,
    department d
WHERE
        p.department_id = d.department_id
    AND price < 100;
    

--insert into select
insert into r_customer(id, name, email)
select customer_id, first_name, email_address
from customer;

CREATE TABLE new_table
  AS (SELECT * FROM customer);
  
INSERT INTO Customer (customer_id, first_name, last_name)
SELECT employee_id, first_name, last_name 
FROM employee
where employee_id > 20;

SELECT salary, NVL(to_char(salary), 'If null, this value') "TAVSIF"
FROM employee;

SELECT employee_id, COALESCE(salary, department_id, manager_id)
from employee;

--bitand
SELECT
    bitand(14, 9)                bitand,
    (14 + 9) - bitand(14, 9)     bitor,
    (14 + 9) - bitand(14, 9) * 2 bitxor
FROM dual;

--all
SELECT first_name, salary
FROM employee
WHERE  salary > ALL (20000, 30000, 40000);

SELECT first_name, salary
FROM employee
WHERE
        salary > 20000
    AND salary > 30000
    AND salary > 40000;
    
--any
SELECT first_name, salary
FROM employee
WHERE  salary > ANY (20000, 30000, 40000);

SELECT first_name, salary
FROM employee
WHERE
        salary > 20000
    OR salary > 30000
    OR salary > 40000;
    
CREATE TABLE ishchi (
    i_id     INT,
    ism      VARCHAR2(20),
    familiya VARCHAR2(30)
);

ALTER TABLE ishchi
RENAME TO hodim;

ALTER TABLE hodim 
ADD telefon INT;

ALTER TABLE hodim
DROP column telefon;

ALTER TABLE hodim
MODIFY ism CHAR(10);

ALTER TABLE hodim
CHANGE ism Nomi VARCHAR2(50);



ALTER TABLE Persons
MODIFY age int NOT NULL;

ALTER TABLE Persons
MODIFY Age NULL;

ALTER TABLE hodim
ADD UNIQUE(soqqa);

ALTER TABLE hodim
ADD CONSTRAINT UC_hodim UNIQUE (familiya, telefon);

ALTER TABLE hodim
DROP CONSTRAINT UC_Hodim;

ALTER TABLE hodim
ADD CONSTRAINT PK_Hodim PRIMARY KEY (i_id, ism);

ALTER TABLE hodim
DROP CONSTRAINT PK_Hodim;

INSERT INTO hodim(I_ID, ism, familiya) VALUES(1, 'aa', 'zz');

CREATE TABLE Persons (
    PersonID int NOT NULL,
    LastName varchar(255) NOT NULL,
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (PersonID)
);

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    CONSTRAINT PK_PersonOrder PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

ALTER TABLE Persons
ADD CONSTRAINT CHK_Persons CHECK( AGE > 18 );

ALTER TABLE PERSONS
DROP CONSTRAINT CHK_PERSONS;

CREATE TABLE Orders (
    ID int NOT NULL, 
    OrderDate_1 Date DEFAULT SYSDATE,
    OrderDate_2 Date DEFAULT CURRENT_TIMESTAMP,
    OrderDate_3 Timestamp DEFAULT SYSDATE,
    OrderDate_4 Timestamp DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO orders (id) values(1);
INSERT INTO orders (id) values(2);
INSERT INTO orders (id) values(3);
INSERT INTO orders (id) values(4);
INSERT INTO orders (id) values(5);
INSERT INTO orders (id) values(6);
INSERT INTO orders (id) values(7);
INSERT INTO orders (id) values(8);
INSERT INTO orders (id) values(9);

SELECT*FROM ORDERS;

alter table orders
MODIFY orderdate_1 DEFAULT NULL;

alter table orders
MODIFY id DEFAULT NULL;

CREATE INDEX employee
ON table_name (column1, column2, ...);

CREATE SEQUENCE seq_name
MINVALUE 1
MAXVALUE 999
START WITH 1
INCREMENT BY 1
NOCACHE;

SELECT SEQ_NAME.NEXTVAL
FROM DUAL;

ALTER SEQUENCE SEQ_NAME
INCREMENT BY 125;

ALTER SEQUENCE seq_name
INCREMENT BY 1;


DROP SEQUENCE SEQ_NAME;

SELECT value
FROM V$NLS_PARAMETERS
WHERE parameter = 'NLS_DATE_FORMAT';
  
SELECT sysdate
FROM dual;

ALTER SESSION 
SET NLS_DATE_FORMAT = 'DD.MM.YY';