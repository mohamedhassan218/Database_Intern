CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAllInstructors`()
BEGIN
	SELECT * FROM instructor WHERE flag = 1;
END