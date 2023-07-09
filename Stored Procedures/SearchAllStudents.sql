CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAllStudents`()
BEGIN
	SELECT * FROM student 
    WHERE flag = 1;
END