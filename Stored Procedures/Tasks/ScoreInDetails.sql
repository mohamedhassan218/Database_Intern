CREATE DEFINER=`root`@`localhost` PROCEDURE `ScoreInDetails`(
	in p_s_ID int,
    in p_c_ID int
)
BEGIN
	declare quiz_summation int;
    declare midterm_summation int;
	declare final_degree int;
    declare p_course_name varchar(300);
    
    select sum(student_exam.degree) into quiz_summation
    from exam
    inner join student_exam on exam_ID = e_ID 
    where student_exam.s_ID = p_s_ID and exam.c_ID = p_c_ID and exam.exam_type = 'Quiz';
    
    
    select sum(student_exam.degree) into midterm_summation
    from exam
    inner join student_exam on exam_ID = e_ID 
    where student_exam.s_ID = p_s_ID and exam.c_ID = p_c_ID and exam.exam_type = 'Midterm';
    
    select sum(student_exam.degree) into final_degree
    from exam
    inner join student_exam on exam_ID = e_ID 
    where student_exam.s_ID = p_s_ID and exam.c_ID = p_c_ID and exam.exam_type = 'Final';
    
    select course_name into p_course_name from course where course_ID = p_c_ID;
    
    select student.student_name as 'Name', p_course_name as 'Course',
		quiz_summation as 'Total Quiz', midterm_summation as 'Total Midterm',
        final_degree as 'Total Final'
	from student 
    where student_ID = p_s_ID and student.flag = 1;
END