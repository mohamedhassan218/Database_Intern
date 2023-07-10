CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCourseID`(
	IN p_c_ID INT
)
BEGIN
	SELECT * FROM course
    WHERE flag = 1 AND course_ID = p_c_ID;
END