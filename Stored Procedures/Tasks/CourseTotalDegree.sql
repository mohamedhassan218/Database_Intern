CREATE DEFINER=`root`@`localhost` PROCEDURE `CourseTotalDegree`(
	in p_course_ID int
)
BEGIN
     select student_ID as 'Student ID', student_name as 'Name',sum(student_exam.degree) as 'Total Degrees'
            from student
            join student_exam on student_ID=s_ID
            join exam on e_ID=exam_ID
            where (exam.exam_type = 'Quiz' or exam.exam_type = 'Midterm') and exam.flag = 1 and c_ID=p_course_ID
            group by student_ID;
END