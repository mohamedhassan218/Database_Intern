CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAllCourses`()
BEGIN
	SELECT * FROM course
    WHERE flag = 1;
END