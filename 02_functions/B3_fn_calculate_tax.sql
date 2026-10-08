CREATE OR REPLACE FUNCTION fn_calculate_tax(p_salary NUMBER) 
RETURN NUMBER IS
    v_tax NUMBER := 0;
BEGIN
    IF p_salary < 3000 THEN
        v_tax := 0;
    ELSIF p_salary BETWEEN 3000 AND 6000 THEN
        v_tax := p_salary * 0.10; -- 10% tax
    ELSE
        v_tax := p_salary * 0.20; -- 20% tax
    END IF;
    RETURN v_tax;
END fn_calculate_tax;
/