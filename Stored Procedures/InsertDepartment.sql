CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDepartment`(
	IN p_department_name VARCHAR(100),
    OUT p_error_msg VARCHAR(200)
)
BEGIN
	DECLARE duplicates INT;
    SELECT COUNT(*) INTO duplicates FROM department
    WHERE p_department_name = department_name;

	IF duplicates > 0 THEN 
		SET p_error_msg = 'This department is already existed.';
	ELSE
		INSERT INTO department (department_name, number_of_students, number_of_instructors, number_of_courses)
        VALUES (p_department_name, p_no_of_students, p_no_of_instructors, p_no_of_courses);
    END IF;
END