CREATE DEFINER=`root`@`localhost` PROCEDURE `NotPassedCourses`(
	in p_s_ID int
)
BEGIN
	select student.student_name as 'Student Name', course.course_name as 'Course Name'
    from student
    inner join student_course on student.student_ID = student_course.s_ID
    inner join course on student_course.c_ID = course.course_ID
    where student_course.total_degree < 50 and student_ID = p_s_ID;
END