CREATE DEFINER=`root`@`localhost` PROCEDURE `Task1`(
	IN p_d_ID INT
)
BEGIN
	SELECT * FROM course
    WHERE d_ID = p_d_ID AND flag = 1;
END