SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Annual Salary for 5000: ' || fn_annual_salary(5000));
    DBMS_OUTPUT.PUT_LINE('Years of Service since 2020-01-01: ' || fn_years_of_service(TO_DATE('2020-01-01', 'YYYY-MM-DD')));
    DBMS_OUTPUT.PUT_LINE('Tax on 7000: ' || fn_calculate_tax(7000));
    DBMS_OUTPUT.PUT_LINE('Department 10 is: ' || fn_dept_name(10));
END;
/