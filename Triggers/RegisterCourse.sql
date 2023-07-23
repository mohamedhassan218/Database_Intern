CREATE DEFINER=`root`@`localhost` TRIGGER `university_db`.`student_AFTER_INSERT` AFTER INSERT ON `student` FOR EACH ROW
BEGIN
	declare t_c_ID int;
    declare flag bool default false;
    declare course_pntr cursor for select course_ID from course where course.d_ID = new.d_ID and course.flag = 1 and course.academic_year = new.y_ID;
    declare continue handler for not found set flag = true;
    
    open course_pntr;
		register_loop: loop
			fetch course_pntr into t_c_ID;
            if flag then
				leave register_loop;
			end if;
            
            insert into student_course(s_ID, c_ID)
            values(new.student_ID, t_c_ID);
		end loop;
    close course_pntr;
END