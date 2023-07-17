CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDepartmentName`(
	IN p_d_name VARCHAR(200),
    out msg varchar(300)
)
BEGIN
	declare instructors_cntr int;
    declare courses_cntr int;
	declare students_cntr int;
    
    select number_of_instructors into instructors_cntr
    from department
    where department_name = p_d_name;
    
    select number_of_students into students_cntr
    from department 
    where department_name = p_d_name;
    
    select number_of_courses into courses_cntr
    from department 
    where department_name = p_d_name;
    
	if courses_cntr > 0 then
		set msg = 'Department can not be deleted due to courses in it.';
	elseif students_cntr > 0 then
		set msg = 'Department can not be deleted due to students in it.';
	elseif instructors_cntr > 0 then
		set msg = 'Department can not be deleted due to instructors in it.';
	else
		UPDATE department
		SET flag = 0
		WHERE department_name = p_d_name;
        set msg = 'Department is deleted successfully.';
	end if;
END