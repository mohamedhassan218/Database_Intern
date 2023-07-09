CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDepartmentName`(
	IN p_d_name VARCHAR(200)
)
BEGIN
	UPDATE department
	SET flag = 0
	WHERE department_name = p_d_name;
END