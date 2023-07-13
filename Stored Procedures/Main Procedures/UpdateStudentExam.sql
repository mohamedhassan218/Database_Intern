CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStudentExam`(
	in p_s_id int,
    in p_e_id int, 
    in p_degree int,
    out msg varchar(300)
)
BEGIN
	update student_exam
    set degree = p_degree
    where s_ID = p_s_id and e_ID = p_e_id;
	
    if row_count() > 0 then
		set msg = 'Updates is succedded.';
	else
		set msg = 'ID is not correct, please enter them correctly.';
	end if;
END