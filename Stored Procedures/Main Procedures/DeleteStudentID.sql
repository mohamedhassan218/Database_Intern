CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteStudentID`(
	IN p_s_ID INT,
    out msg varchar(300)
)
BEGIN
	UPDATE student
	SET flag = 0
	WHERE student_ID = p_s_ID; 

	if row_count() > 0 then
		set msg = 'Student is deleted successfully.';
	else	
		set msg = 'Student is not exist';
	end if;
END