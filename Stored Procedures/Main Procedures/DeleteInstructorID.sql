CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteInstructorID`(
	IN p_i_ID INT
)
BEGIN
	UPDATE instructor
    SET flag = 0
    WHERE instructor_ID = p_i_ID;
    
    update department
    set number_of_instructors = number_of_instructors - 1
    where department_ID = (select d_ID from instructor where instructor_ID = p_i_ID);
END