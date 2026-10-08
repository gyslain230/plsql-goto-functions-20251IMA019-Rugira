CREATE OR REPLACE FUNCTION fn_dept_name(p_dept_id NUMBER) 
RETURN VARCHAR2 IS
    v_dept_name departments.dept_name%TYPE;
BEGIN
    SELECT dept_name INTO v_dept_name 
    FROM departments 
    WHERE dept_id = p_dept_id;
    
    RETURN v_dept_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Unknown Department';
END fn_dept_name;
/