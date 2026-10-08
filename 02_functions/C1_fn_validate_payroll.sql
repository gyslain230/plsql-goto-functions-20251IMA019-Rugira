CREATE OR REPLACE FUNCTION fn_validate_payroll(p_emp_id NUMBER) 
RETURN VARCHAR2 IS
    v_salary employees.salary%TYPE;
    v_tax NUMBER;
    v_net_pay NUMBER;
    invalid_salary EXCEPTION;
BEGIN
    SELECT salary INTO v_salary FROM employees WHERE emp_id = p_emp_id;
    
    IF v_salary IS NULL OR v_salary <= 0 THEN
        RAISE invalid_salary;
    END IF;

    v_tax := fn_calculate_tax(v_salary);
    v_net_pay := v_salary - v_tax;
    
    RETURN 'Valid: Net Pay is ' || v_net_pay;
EXCEPTION
    WHEN invalid_salary THEN
        RETURN 'Error: Invalid or zero salary.';
    WHEN NO_DATA_FOUND THEN
        RETURN 'Error: Employee not found.';
    WHEN OTHERS THEN
        RETURN 'Error: System fault.';
END fn_validate_payroll;
/