-- Rewriting A2 without using GOTO statements
SET SERVEROUTPUT ON;
BEGIN
    FOR emp IN (SELECT first_name, salary FROM employees) LOOP
        IF emp.salary < 3000 THEN
            DBMS_OUTPUT.PUT_LINE('REVIEW REQUIRED: ' || emp.first_name || ' earns ' || emp.salary);
            CONTINUE; -- Skips the rest of the loop iteration cleanly
        END IF;
        
        DBMS_OUTPUT.PUT_LINE(emp.first_name || ' has a standard salary: ' || emp.salary);
    END LOOP;
END;
/