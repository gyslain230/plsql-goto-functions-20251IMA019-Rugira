-- Drop tables if they exist to allow clean reruns
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE departments CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    salary NUMBER,
    hire_date DATE,
    dept_id NUMBER REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES (10, 'IT');
INSERT INTO departments VALUES (20, 'HR');
INSERT INTO departments VALUES (30, 'Finance');

INSERT INTO employees VALUES (101, 'Rugira', 'Gyslain', 6000, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 10);
INSERT INTO employees VALUES (102, 'Alice', 'Smith', 4500, TO_DATE('2021-06-20', 'YYYY-MM-DD'), 20);
INSERT INTO employees VALUES (103, 'Bob', 'Johnson', 2500, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 10);
INSERT INTO employees VALUES (104, 'Eve', 'Davis', 8000, TO_DATE('2019-11-05', 'YYYY-MM-DD'), 30);
COMMIT;