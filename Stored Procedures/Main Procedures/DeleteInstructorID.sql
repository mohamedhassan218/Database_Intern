CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteInstructorID`(
	IN p_i_ID INT,
    out msg varchar(300)
)
BEGIN
    declare ins_exist int;
    
    select count(*) into ins_exist
    from course
    where i_ID = p_i_ID and flag = 1;
    
    if ins_exist > 0 then
		update department join instructor on department_ID = d_ID
		set number_of_instructors = number_of_instructors - 1
		where instructor_ID = p_i_ID and instructor.flag = 1;
    
		UPDATE instructor
		SET flag = 0
		WHERE instructor_ID = p_i_ID;
    
		if row_count() > 0 then
			set msg = 'Instructor is deleted successfully.';
		else
			set msg = 'Instructor ID is not found.';
		end if;
	else
		set msg = 'Instructor can not be deleted due to courses registered to.';
	end if;
END