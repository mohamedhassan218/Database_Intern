CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAllUsers`()
BEGIN
	SELECT * FROM USER WHERE flag = 1;
END