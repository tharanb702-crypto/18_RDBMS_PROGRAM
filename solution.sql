CREATE DATABASE COLLEGEDB;
USE COLLEGEDB;

ALTER TABLE student ADD department_name VARCHAR2(100);

CREATE OR REPLACE FUNCTION get_department_student_count (
    p_department_name IN VARCHAR2
) RETURN NUMBER AS
    v_student_count NUMBER := 0;
BEGIN
  
    SELECT COUNT(*)
    INTO v_student_count
    FROM student
    WHERE LOWER(department_name) = LOWER(p_department_name);

    RETURN v_student_count;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
        RETURN 0;
END get_department_student_count;
/

SET SERVEROUTPUT ON;

DECLARE
    v_count NUMBER;
BEGIN

    UPDATE student 
    SET department_name = 'Computer Science' 
    WHERE student_id = 101;
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Number of students in Computer Science: ' || v_count);
END;
/
