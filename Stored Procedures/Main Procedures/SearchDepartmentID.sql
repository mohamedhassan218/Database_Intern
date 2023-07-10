CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDepartmentID`(
	IN p_d_ID INT
)
BEGIN
	SELECT * FROM department 
	WHERE p_d_ID = department_ID;
END