CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAllDepartments`()
BEGIN
	SELECT * FROM department
	WHERE flag = 1;
END