CREATE DEFINER=`root`@`localhost` TRIGGER `university_db`.`course_AFTER_INSERT` AFTER INSERT ON `course` FOR EACH ROW
BEGIN
	declare t_s_ID int;
	declare flag bool default false;
	declare student_pntr cursor for select student_ID from student where student.d_ID = new.d_ID and student.flag = 1;
	declare continue handler for not found set flag = true;

    open student_pntr;
		enroll_loop: loop
			fetch student_pntr into t_s_ID;
        
			if flag then
				leave enroll_loop;
			end if;
        
			insert into student_course(s_ID, c_ID)
			values(t_s_ID, new.d_ID);
		end loop;
    close student_pntr;
END