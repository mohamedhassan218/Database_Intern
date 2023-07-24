CREATE DEFINER=`root`@`localhost` PROCEDURE `PreventedStudents`(
	in p_course_ID int
)
BEGIN
	select student.student_name as 'Name', student.student_ID as 'ID', student.student_email as 'Email', department.department_name as 'Department'
    from student
    inner join student_course on student_course.s_ID = student.student_ID and student_course.c_ID = p_course_ID
    inner join department on student.d_ID = department.department_ID
    where student_course.attended_lectures < (select minimum_lectures from course where course_ID = p_course_ID and course.flag = 1);
END