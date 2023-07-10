CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteExam`(
	IN p_e_ID INT
)
BEGIN
	UPDATE exam
    SET flag = 0
    WHERE exam_ID = p_e_ID;
END