CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteExam`(
	IN p_e_ID INT,
    in p_author_ID int,
    out msg varchar(300)
)
BEGIN
	declare auth_ID int;
    declare auth_type int;
    if exists (select e_ID from student_exam where e_ID = p_e_ID) then
		set msg = 'This exam can not be deleted.';
	else
		select author into auth_ID from exam where exam_ID = p_e_ID;
		select user_type into auth_type from user_data where user_ID = p_author_ID;
        if auth_ID = p_author_ID  or auth_type = 1 then
			UPDATE exam
			SET flag = 0
			WHERE exam_ID = p_e_ID;
			set msg = 'The exam is deleted successfully.';
		else
			set msg = 'You do not have the permission to delet this exam.';
        end if;
    end if;
END