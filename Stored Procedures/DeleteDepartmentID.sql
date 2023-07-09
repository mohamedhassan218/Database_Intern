CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDepartmentID`(
	IN p_d_ID INT
)
BEGIN
	UPDATE department
	SET flag = 0
	WHERE department_ID = p_d_ID;
END