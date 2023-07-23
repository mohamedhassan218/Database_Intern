CREATE DEFINER=`root`@`localhost` PROCEDURE `GetYearCourses`(
	in p_y_ID int
)
BEGIN
	select course_name as 'Course Name', course_ID as 'ID', lectures_number as 'Number of Lectures', department_name as 'Department Name', year_a as 'Year'
    from course
    inner join academic_year on course.academic_year = academic_year.year_ID
	inner join department on department_ID = d_ID
    where p_y_ID = academic_year;
END