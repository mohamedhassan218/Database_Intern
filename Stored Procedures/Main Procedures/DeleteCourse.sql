CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCourse`(
	IN p_c_ID INT,
    in author_id int,
    out msg varchar(300)
)
BEGIN
	if exists (select c_ID from student_course where c_ID = p_c_ID and flag = 1) then
		set msg = 'This course can not be deleted';
	else
		if not exists (select course_ID from course where course_ID = p_c_ID and author_id = author) then
			if author_id = 1 then
				update department left join course on department_ID = d_ID
				set number_of_courses = number_of_courses - 1
				where course_ID = p_c_ID and course.flag = 1;
                
				UPDATE course
				SET flag = 0
				WHERE course_ID = p_c_ID;
                
				set msg = 'Course is deleted successfully.';
            else
				set msg = 'You do not have the permission to delete the course.';
			end if;
		else
			update department left join course on department_ID = d_ID
			set number_of_courses = number_of_courses - 1
			where course_ID = p_c_ID and course.flag = 1;
            set msg = 'Course is deleted successfully.';
			
			UPDATE course
			SET flag = 0
			WHERE course_ID = p_c_ID;
		end if;
	end if;
END