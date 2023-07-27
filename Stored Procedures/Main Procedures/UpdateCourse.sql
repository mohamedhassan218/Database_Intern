CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCourse`(
	IN p_c_ID INT,
    IN p_c_name VARCHAR(150),
    IN p_c_lectures_number INT,
    IN p_minimum_lectures INT,
    IN p_d_ID INT,
    IN p_i_ID INT,
    IN p_academic_year INT,
    in p_author_ID int,
    OUT msg VARCHAR(200)
)
BEGIN
	-- Permissions: only admins or instructor that teach the course can update it.
    declare p_usr_type int;
    declare p_ins_ID int;
    if exists (select 1 from course where p_c_name = course_name) then
		set msg = 'Name is already exists.';
	elseif not exists (select 1 from department where department_ID = p_d_ID) then
		set msg = 'Department ID is not exist.';
	elseif not exists (select 1 from instructor where instructor_ID = p_i_ID) then
		set msg = 'Instructor Id is not exist.';
	elseif not exists (select 1 from academic_year where year_ID = p_academic_year) then
		set msg = 'Academic Year is not exist.';
	else
		-- Check the user type.
        select user_type into p_usr_type 
        from user_data
        where user_ID = p_author_ID and flag = 1; 
        
        -- Get the instructor id of the course.
        select i_ID into p_ins_ID
        from user_data
        where user_ID = p_author_ID and flag = 1;
        
        if p_ins_ID = p_i_ID or p_usr_type = 1 then
			UPDATE course 
			SET course_name = p_c_name, lectures_number = p_c_lectures_number, minimum_lectures = p_minimum_lectures, 
			d_ID = p_d_ID, i_ID = p_i_ID, academic_year = p_academic_year
			WHERE course_ID = p_c_ID;
			SET msg = 'Course updated successfully.';
		else
			set msg = 'You do not have the permission to update this course.';
		end if;
	end if;
END