CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteExam`(
	IN p_e_ID INT,
    out msg varchar(300)
)
BEGIN
    if exists (select 1 from student_exam where e_ID = p_e_ID and flag = 1) then
		set msg = 'This exam can not be deleted.';
	else
		UPDATE exam
		SET flag = 0
		WHERE exam_ID = p_e_ID;
        set msg = 'The exam is deleted successfully.';
	end if;
END