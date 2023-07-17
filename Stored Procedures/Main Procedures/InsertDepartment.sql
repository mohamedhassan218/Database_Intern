CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDepartment`(
	IN p_department_name VARCHAR(100),
    OUT p_error_msg VARCHAR(200)
)
BEGIN
	DECLARE duplicates INT;
    if p_department_name is null then
		set p_error_msg = 'Department name can not be null.';
	else 
		SELECT COUNT(*) INTO duplicates FROM department
		WHERE p_department_name = department_name;

		IF duplicates > 0 THEN 
			SET p_error_msg = 'This department is already existed.';
		ELSE
			INSERT INTO department (department_name)
			VALUES (p_department_name);
		END IF;
	end if;
END