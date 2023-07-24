CREATE DEFINER=`root`@`localhost` PROCEDURE `TopTenInMidterm`(
	in p_c_ID int
)
BEGIN
	select student.student_name as 'Name', student.student_ID as 'ID', student.profile_photo as 'Personal Image', course.course_name as 'Course Name'
    from course
    inner join exam on exam.c_ID = p_c_ID and exam.flag = 1
    inner join student_exam on exam.exam_ID = student_exam.e_ID
    inner join student on student.student_ID = student_exam.s_ID and student.flag = 1
    where course_ID = p_c_ID and exam.exam_type = 'Midterm'
    order by student_exam.degree desc
    limit 10;
END