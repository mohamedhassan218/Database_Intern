CREATE DEFINER=`root`@`localhost` PROCEDURE `GetYearInstructors`(
	in p_y_ID int
)
BEGIN
	select instructor_name as 'Instructor', instructor_ID as 'ID' from instructor
	left join course on instructor_ID = i_ID
	left join academic_year on course.academic_year = academic_year.year_ID 
    where academic_year.year_ID = p_y_ID and instructor.flag = 1;
END