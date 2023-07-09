CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteStudentID`(
	IN p_s_ID INT
)
BEGIN
	UPDATE student
	SET flag = 0
	WHERE student_ID = p_s_ID; 
END