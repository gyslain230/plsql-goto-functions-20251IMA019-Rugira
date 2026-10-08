SET SERVEROUTPUT ON;
BEGIN
    -- Test Valid Employee (Rugira)
    DBMS_OUTPUT.PUT_LINE('Emp 101: ' || fn_validate_payroll(101));
    
    -- Test Invalid Employee
    DBMS_OUTPUT.PUT_LINE('Emp 999: ' || fn_validate_payroll(999));
END;
/