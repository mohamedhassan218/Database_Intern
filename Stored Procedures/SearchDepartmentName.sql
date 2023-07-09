CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDepartmentName`(
	IN p_d_name VARCHAR(200)
)
BEGIN
	SELECT * FROM department 
	WHERE p_d_name = department_name;
END