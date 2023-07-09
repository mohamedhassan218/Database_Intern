CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchStudentID`(
	IN p_s_ID INT
)
BEGIN
	SELECT * FROM student
    WHERE student_ID = p_s_ID AND flag = 1;
END