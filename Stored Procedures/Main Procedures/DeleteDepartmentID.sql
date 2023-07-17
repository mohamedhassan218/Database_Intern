CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDepartmentID`(
	IN p_d_ID INT,
    out msg varchar(400)
)
BEGIN
	declare instructors_cntr int;
    declare courses_cntr int;
	declare students_cntr int;
    
    select number_of_instructors into instructors_cntr
    from instructor
    where d_ID = p_d_ID and flag = 1;
    
    select number_of_students into students_cntr
    from student
    where d_ID = p_d_ID and flag = 1;
    
    select number_of_courses into courses_cntr
    from course
    where d_ID = p_d_ID and flag = 1;
    
	if courses_cntr > 0 then
		set msg = 'Department can not be deleted due to courses in it.';
	elseif students_cntr > 0 then
		set msg = 'Department can not be deleted due to students in it.';
	elseif instructors_cntr > 0 then
		set msg = 'Department can not be deleted due to instructors in it.';
	else
		UPDATE department 
		SET flag = 0
		WHERE department_ID = p_d_ID;
        set msg = 'Department is deleted successfully.';
	end if;
END