SET SERVEROUTPUT ON;
BEGIN
    FOR emp IN (SELECT first_name, salary FROM employees) LOOP
        IF emp.salary < 3000 THEN
            GOTO needs_review;
        END IF;
        
        DBMS_OUTPUT.PUT_LINE(emp.first_name || ' has a standard salary: ' || emp.salary);
        GOTO next_record;

        <<needs_review>>
        DBMS_OUTPUT.PUT_LINE('REVIEW REQUIRED: ' || emp.first_name || ' earns ' || emp.salary);

        <<next_record>>
        NULL; -- GOTO requires an executable statement
    END LOOP;
END;
/