CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCourse`(
	IN p_c_ID INT,
    IN p_c_name VARCHAR(150),
    IN p_c_lectures_number INT,
    IN p_minimum_lectures INT,
    IN p_d_ID INT,
    IN p_i_ID INT,
    IN p_academic_year INT,
    OUT msg VARCHAR(200)
)
BEGIN
    if exists (select 1 from course where p_c_name = course_name) then
		set msg = 'Name is already exists.';
	elseif not exists (select 1 from department where department_ID = p_d_ID) then
		set msg = 'Department ID is not exist.';
	elseif not exists (select 1 from instructor where instructor_ID = p_i_ID) then
		set msg = 'Instructor Id is not exist.';
	elseif not exists (select 1 from academic_year where year_ID = p_academic_year) then
		set msg = 'Academic Year is not exist.';
	else	
		UPDATE course 
		SET course_name = p_c_name, lectures_number = p_c_lectures_number, minimum_lectures = p_minimum_lectures, 
		d_ID = p_d_ID, i_ID = p_i_ID, academic_year = p_academic_year
		WHERE course_ID = p_c_ID;
        SET msg = 'Course updated successfully.';
	end if;
END