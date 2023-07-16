CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentExamDegree`()
BEGIN
	select  student.student_name as `Student Name`, department.department_name as `Department`,
    course.course_name as `Course name`, exam.exam_name as `Exam Name`, student_exam.degree as `Degree`
    from student
    inner join department on student.d_ID = department.department_ID
	inner join student_course on student_course.s_ID = student.student_ID
    inner join course on student_course.c_ID = course.course_ID
    inner join exam on course.course_ID = exam.c_ID
    inner join student_exam on exam.exam_ID=student_exam.e_ID and student.student_ID=student_exam.s_ID;
END