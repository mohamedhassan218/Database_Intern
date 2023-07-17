CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteExam`(
	IN p_e_ID INT,
    out msg varchar(300)
)
BEGIN
	declare ifAvaliable int;
    
    select count(*) into ifAvaliable
    from student_exam
    where e_ID = p_e_ID and flag = 0;
    
    if ifAvaliable > 0 then 
		set msg = 'This exam can not be deleted.';
	else
		UPDATE exam
		SET flag = 0
		WHERE exam_ID = p_e_ID;
        set msg = 'The exam is deleted successfully.';
	end if;
END