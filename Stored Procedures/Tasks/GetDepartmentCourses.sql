CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDepartmentCourses`(
	in p_d_ID int
)
BEGIN
	select course_name as 'Course Name' ,course_ID as 'Course ID', academic_year as 'Year'
    from course
    where d_ID = p_d_ID and course.flag = 1;
END