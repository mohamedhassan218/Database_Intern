CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchExamID`(
	IN p_e_ID INT
)
BEGIN
	SELECT * FROM exam
	WHERE exam_ID = p_e_ID AND flag = 1;
END