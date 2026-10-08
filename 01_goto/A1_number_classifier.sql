SET SERVEROUTPUT ON;
DECLARE
    v_num NUMBER := 15;
BEGIN
    IF v_num > 0 THEN
        GOTO positive_num;
    ELSIF v_num < 0 THEN
        GOTO negative_num;
    ELSE
        GOTO zero_num;
    END IF;

    <<positive_num>>
    DBMS_OUTPUT.PUT_LINE(v_num || ' is a positive number.');
    GOTO end_block;

    <<negative_num>>
    DBMS_OUTPUT.PUT_LINE(v_num || ' is a negative number.');
    GOTO end_block;

    <<zero_num>>
    DBMS_OUTPUT.PUT_LINE('The number is zero.');

    <<end_block>>
    DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
/