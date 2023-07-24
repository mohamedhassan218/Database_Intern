CREATE DEFINER=`root`@`localhost` PROCEDURE `ScoreAndGPA`(
	in p_course_ID int
)
BEGIN
	select student.student_name as 'Name', student.student_ID as 'ID', course.course_name as 'Course', student_course.total_degree as 'Total Degree', gpa.rate as 'Total GPA'
    from student 
    inner join student_course on student_course.s_ID = student.student_ID
    inner join course on course.course_ID = student_course.c_ID
    inner join gpa on student_course.total_degree between gpa.grades_upper and gpa.grades_less
	where course.course_ID = p_course_ID;
END