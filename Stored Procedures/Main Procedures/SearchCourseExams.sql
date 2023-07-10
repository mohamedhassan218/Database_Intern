CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCourseExams`(
	IN p_c_ID INT
)
BEGIN
	SELECT *
    FROM exam
    WHERE c_ID = p_c_ID AND flag = 1;
END