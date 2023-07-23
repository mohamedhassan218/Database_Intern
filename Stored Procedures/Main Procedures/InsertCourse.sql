CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCourse`(
	IN p_c_name VARCHAR(150),
    IN p_c_lectures_number INT,
    IN p_minimum_lectures INT,
    IN p_d_ID INT,
    IN p_i_ID INT,
    IN p_academic_year INT,
    in p_course_degree INT,
    OUT msg VARCHAR(200)
)
BEGIN
    if p_c_name is null then
		set msg = 'Name can not be null.';
	elseif p_c_lectures_number is null then
		set msg = 'Number of lectures can not be null.';
	elseif p_minimum_lectures is null then
		set msg = 'You must specify the minimum number of lectures.';
	elseif p_d_ID is null then
		set msg = 'You must specify the department ID.';
	elseif p_i_ID is null then 
		set msg = 'Instructor ID can not be null.';
	elseif p_academic_year is null then
		set msg = 'You must specify the academic year of the course.';
	elseif p_course_degree is null then
		set msg = 'Course degree can not be null.';
	elseif p_course_degree < 0 then
		set msg = 'Course Degree must be greater than zero.';
	else
        if exists (select 1 from course where p_c_name = course_name) then
			SET msg = 'Course is already exist.';
        elseif not exists (select 1 from department where department_ID = p_d_ID) then
			SET msg = 'Department is not found.';
		elseif not exists (select 1 from instructor where instructor_ID = p_i_ID) then
			SET msg = 'Instructor is not found.';
		elseif not exists (select 1 from academic_year where year_ID = p_academic_year) then
			SET msg = 'Academic year is not found.';
		ELSEIF p_c_lectures_number < p_minimum_lectures OR p_minimum_lectures < 0 OR p_c_lectures_number < 0 THEN
			SET msg = 'Please enter the number of lectures and minimum number of lectures correctly.';
		ELSE 
			INSERT INTO course (course_name, lectures_number, minimum_lectures, d_ID, i_ID, academic_year, course_degree)
			VALUES (p_c_name, p_c_lectures_number, p_minimum_lectures, p_d_ID, p_i_ID, p_academic_year, p_course_degree);
			SET msg = 'Course is inserted successfully.';
			UPDATE department
			SET number_of_courses = number_of_courses + 1
			WHERE department_ID = p_d_ID;
		END IF;
    end if;
END