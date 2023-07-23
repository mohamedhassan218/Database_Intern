CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStudentExam`(
	in p_s_ID int,
    in p_e_ID int,
    in p_degree int,
    out msg varchar(300)
)
BEGIN
    if p_s_ID is null then 
		set msg = 'Student Id must be specified.';
	elseif p_e_ID is null then 
		set msg = 'Exam Id must be specified.';
	elseif p_degree is null then
		set msg = 'Degree must be filled.';
	else
        if exists (select 1 from student where student_ID = p_s_ID) then
			if exists (select 1 from exam where exam_ID = p_e_ID) then
				insert into student_exam(s_ID, e_ID, degree)
				values(p_s_ID, p_e_ID, p_degree);
				set msg = 'Succedded.';
			else
				set msg = 'Exam is not found.';
			end if;
		else
			set msg = 'Student is not found.';
		end if;
    end if;
END