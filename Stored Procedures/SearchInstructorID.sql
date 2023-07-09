CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchInstructorID`(
	IN p_i_ID INT
)
BEGIN
	SELECT * FROM instructor
    WHERE instructor_ID = p_i_ID AND flag = 1;
END