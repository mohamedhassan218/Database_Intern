CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCourse`(
	IN p_c_ID INT
)
BEGIN
	UPDATE course
    SET flag = 0
    WHERE course_ID = p_c_ID;
END