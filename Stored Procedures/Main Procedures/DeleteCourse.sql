CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCourse`(
	IN p_c_ID INT,
    out msg varchar(300)
)
BEGIN
	declare ifAvailable int;
    declare ifRegistered int;
    
    select count(*) into ifAvailable 
    from student_course
    where c_ID = p_c_ID;
    
    if ifAvailable > 0 then
		set msg = 'This course can not be deleted';
	else
		select count(*) into ifRegistered
        from student_course
        where c_ID = p_c_ID;
        if ifRegistered > 0 then
			set msg = 'Course can not be deleted due to students registerd it.';
		else
			update department left join course on department_ID = d_ID
			set number_of_courses = number_of_courses - 1
			where course_ID = p_c_ID and course.flag = 1;
        
			UPDATE course
			SET flag = 0
			WHERE course_ID = p_c_ID;
        
			set msg = 'Course is deleted successfully.';
		end if;
    end if;
END