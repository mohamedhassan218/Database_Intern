CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStudentExam`(
	in p_s_ID int,
    in p_e_ID int,
    in p_degree int,
    out msg varchar(300)
)
BEGIN
	declare student_exist int;
    declare exam_exist int;
    
    select count(*) into student_exist 
    from student 
    where student_ID = p_s_ID;
    
    select count(*) into exam_exist 
    from exam 
    where exam_ID = p_e_ID;
    
    if student_exist > 0 and exam_exist > 0 then
		insert into student_exam(s_ID, e_ID, degree)
        values(p_s_ID, p_e_ID, p_degree);
        set msg = 'Succedded.';
	else
		if student_exist = 0 then
			set msg = 'Student id is not exist.';
		else
			set msg = 'Exam id is not exist.';
		end if;
	end if;
END