-- This file demonstrates an illegal GOTO and how to fix it.
-- PLS-00375: illegal GOTO statement; cannot jump into an IF, LOOP, or block
SET SERVEROUTPUT ON;
DECLARE
    v_status VARCHAR2(10) := 'ACTIVE';
BEGIN
    /* 
    -- ILLEGAL CODE (Causes PLS-00375)
    GOTO jump_inside; 
    IF v_status = 'ACTIVE' THEN
        <<jump_inside>>
        DBMS_OUTPUT.PUT_LINE('This is illegal.');
    END IF;
    */

    -- CORRECTED CODE
    IF v_status = 'ACTIVE' THEN
        DBMS_OUTPUT.PUT_LINE('Status is active.');
        GOTO skip_inactive;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Status is inactive.');
    
    <<skip_inactive>>
    DBMS_OUTPUT.PUT_LINE('Execution finished.');
END;
/